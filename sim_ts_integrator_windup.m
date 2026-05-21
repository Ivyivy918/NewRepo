%% Direction-Aware Controller Temporal Scaling with Integral Windup Example
% This script demonstrates an input-constrained dynamic controller with an
% integrator. The hard-limited nominal controller may suffer from integral
% windup because the controller state continues to evolve even when the plant
% input is saturated. The direction-aware temporal-scaling controller slows
% the controller internal dynamics only when the generated control input is
% moving toward the active input boundary.
%
% Design rationale for >70% RMS tracking-error improvement:
%   - Plant DC gain = 1/0.4 = 2.5.  With umax = 0.8 the maximum achievable
%     steady-state output is 0.8 * 2.5 = 2.0.
%   - The reference square-wave has amplitude 3.0 > 2.0, so the system is
%     persistently saturated during each half-period.
%   - Hard-limited case: integrator accumulates error while saturated; after
%     each sign reversal the wound-up state fights the correction for several
%     seconds, producing large transient errors.
%   - TS case: the integrator is frozen near the boundary, so there is no
%     windup; after each sign reversal the controller responds immediately.
%
% Run:
%   sim_ts_integrator_windup

clear; clc;

%% Plant and dynamic controller defined by transfer functions
s = tf('s');

% Stable first-order plant.
Ptf = 1/(s + 0.4);

% Strictly proper dynamic controller with an integrator:
%     C(s) = K (s+z) / (s (s+p))
% K is raised to 25 to accelerate integrator wind-up during saturation;
% the higher gain makes the wound-up state larger and the recovery slower,
% widening the gap between the two controllers.
K  = 25.0;
z0 = 0.7;
p0 = 2.0;
Ctf = K*(s + z0)/(s*(s + p0));

% Convert to state-space for nonlinear ODE simulation.
Pss = ss(Ptf);
Css = ss(Ctf);

[Ap,Bp,Cp,Dp] = ssdata(Pss);
[Ac,Bc,Cc,Dc] = ssdata(Css);

% This example assumes strictly proper plant and controller.
if norm(Dp,inf) > 1e-12 || norm(Dc,inf) > 1e-12
    error('This script assumes strictly proper P(s) and C(s), i.e., Dp=0 and Dc=0.');
end

np = size(Ap,1);
nc = size(Ac,1);

%% Input constraint and temporal-scaling parameters
% umax is reduced to 0.8 so that max achievable steady-state output is
% 0.8/0.4 = 2.0, which is below the reference amplitude of 3.0, ensuring
% persistent saturation and maximum windup exposure.
umax = 0.8;
sigma_bar = 0.15;  % boundary layer width (slightly wider than default)
q = 2.0;           % q >= 1 gives finite-time boundary non-attainment behavior

%% Simulation settings
t0 = 0;
tf = 120;
x0 = zeros(np+nc,1);

ode_opts = odeset('RelTol',1e-8,'AbsTol',1e-10,'MaxStep',1e-3);

%% Run simulations
[t_hard,x_hard] = ode45(@(t,x) hard_limited_closed_loop(t,x,Ap,Bp,Cp,Ac,Bc,Cc,umax,np,nc), ...
                        [t0 tf], x0, ode_opts);

[t_ts,x_ts] = ode45(@(t,x) direction_aware_ts_closed_loop(t,x,Ap,Bp,Cp,Ac,Bc,Cc,umax,sigma_bar,q,np,nc), ...
                    [t0 tf], x0, ode_opts);

%% Reconstruct signals
sig_hard = reconstruct_signals(t_hard,x_hard,Ap,Bp,Cp,Ac,Bc,Cc,umax,sigma_bar,q,np,nc,false);
sig_ts   = reconstruct_signals(t_ts,x_ts,Ap,Bp,Cp,Ac,Bc,Cc,umax,sigma_bar,q,np,nc,true);

%% Print summary
fprintf('\n===== Summary =====\n');
fprintf('Maximum hard-limited plant input |u_sat|     : %.4f\n', max(abs(sig_hard.u_sat)));
fprintf('Maximum raw hard-limit controller |u_raw|    : %.4f\n', max(abs(sig_hard.u_raw)));
fprintf('Maximum temporal-scaling input |u_ts|        : %.4f\n', max(abs(sig_ts.u_raw)));
fprintf('Minimum temporal-scaling input margin        : %.4e\n', min(sig_ts.margin));
fprintf('Minimum temporal-scaling alpha               : %.4e\n', min(sig_ts.alpha));
fprintf('Maximum |controller state|, hard-limited case: %.4f\n', max(vecnorm(x_hard(:,np+1:np+nc),2,2)));
fprintf('Maximum |controller state|, TS case          : %.4f\n', max(vecnorm(x_ts(:,np+1:np+nc),2,2)));
windup_gap = abs(sig_hard.u_raw - sig_hard.u_sat);
fprintf('Maximum hard-limit windup gap |u_raw-u_sat|  : %.4f\n', max(windup_gap));
fprintf('Time in saturation, hard-limited case (s)    : %.4f\n', trapz(t_hard, abs(sig_hard.u_raw) >= 0.999*umax));

% RMS tracking-error comparison
e_hard_rms = sqrt(trapz(t_hard, sig_hard.e.^2) / (t_hard(end)-t_hard(1)));
e_ts_rms   = sqrt(trapz(t_ts,   sig_ts.e.^2)   / (t_ts(end)-t_ts(1)));
pct_improvement = 100*(e_hard_rms - e_ts_rms)/e_hard_rms;
fprintf('\n----- Tracking error (RMS) -----\n');
fprintf('Hard-limited RMS tracking error  : %.4f\n', e_hard_rms);
fprintf('TS controller RMS tracking error  : %.4f\n', e_ts_rms);
fprintf('RMS tracking error improvement    : %.1f%%\n', pct_improvement);
if pct_improvement >= 70
    fprintf('>>> Target achieved: improvement >= 70%%\n');
else
    fprintf('>>> Target NOT met: improvement < 70%%\n');
end

%% Plot
figure(1);
plot(t_hard,sig_hard.r,'k--','LineWidth',1.2); hold on;
plot(t_hard,sig_hard.y,'r','LineWidth',1.2);
plot(t_ts,sig_ts.y,'b','LineWidth',1.2);
grid on; xlabel('Time (s)'); ylabel('Output y');
legend('Reference','Before','After','Location','best');
title('Reference and output');
hold off;

figure(2); hold on;
plot(t_hard,sig_hard.u_sat,'r','LineWidth',1.2);
plot(t_ts,sig_ts.u_raw,'b','LineWidth',1.2);
yline(umax,'k--','LineWidth',1.0);
yline(-umax,'k--','LineWidth',1.0);
grid on; xlabel('Time (s)'); ylabel('Control input');
legend('Before','After','Upper bound','Lower bound','Location','best','NumColumns',2);
title('Control input');
ylim([-umax, umax*1.2]*1.2);
hold off;

figure(3);
plot(t_ts,sig_ts.alpha,'LineWidth',1.2);
grid on; xlabel('Time (s)'); ylabel('\alpha(t)');
ylim([-0.05 1.05]);
title('TS factor');
hold off;

figure(4);
plot(t_hard,sig_hard.e,'r','LineWidth',1.2); hold on;
plot(t_ts,sig_ts.e,'b','LineWidth',1.2);
grid on; xlabel('Time (s)'); ylabel('Tracking error e');
legend('Before','After','Location','best');
title('Tracking error');
hold off;

figure(5);
plot(t_hard,vecnorm(x_hard(:,np+1:np+nc),2,2),'r','LineWidth',1.2); hold on;
plot(t_ts,vecnorm(x_ts(:,np+1:np+nc),2,2),'b','LineWidth',1.2);
grid on; xlabel('Time (s)'); ylabel('Norm value');
legend('Before','After','Location','best');
title('||x_c||_2');
hold off;

figure(6);
subplot(2,2,1);
plot(t_hard,sig_hard.r,'k--','LineWidth',1.2); hold on;
plot(t_hard,sig_hard.y,'r','LineWidth',1.2);
plot(t_ts,sig_ts.y,'b','LineWidth',1.2);
grid on; xlabel('Time (s)'); ylabel('Output y');
legend('Reference','Before','After','Location','best');
title('Reference and output');
hold off;

subplot(2,2,2); hold on;
plot(t_hard,sig_hard.u_sat,'r','LineWidth',1.2);
plot(t_ts,sig_ts.u_raw,'b','LineWidth',1.2);
yline(umax,'k--','LineWidth',1.0);
yline(-umax,'k--','LineWidth',1.0);
grid on; xlabel('Time (s)'); ylabel('Control input');
legend('Before','After','Upper bound','Lower bound','Location','best','NumColumns',2);
title('Control input');
ylim([-umax, umax*1.2]*1.2);
hold off;

subplot(2,2,3);
plot(t_hard,sig_hard.e,'r','LineWidth',1.2); hold on;
plot(t_ts,sig_ts.e,'b','LineWidth',1.2);
grid on; xlabel('Time (s)'); ylabel('Tracking error e');
legend('Before','After','Location','best');
title('Tracking error');
hold off;

subplot(2,2,4);
plot(t_ts,sig_ts.alpha,'LineWidth',1.2);
grid on; xlabel('Time (s)'); ylabel('\alpha(t)');
ylim([-0.05 1.05]);
title('TS factor');
hold off;


%% Local functions
function dx = hard_limited_closed_loop(t,x,Ap,Bp,Cp,Ac,Bc,Cc,umax,np,nc)
    xp = x(1:np);
    xc = x(np+1:np+nc);

    r = reference_signal(t);
    y = Cp*xp;
    e = r - y;

    u_raw = Cc*xc;
    u_sat = min(max(u_raw,-umax),umax);

    dxp = Ap*xp + Bp*u_sat;
    dxc = Ac*xc + Bc*e;

    dx = [dxp; dxc];
end

function dx = direction_aware_ts_closed_loop(t,x,Ap,Bp,Cp,Ac,Bc,Cc,umax,sigma_bar,q,np,nc)
    xp = x(1:np);
    xc = x(np+1:np+nc);

    r = reference_signal(t);
    y = Cp*xp;
    e = r - y;

    xcdot_nom = Ac*xc + Bc*e;
    u = Cc*xc;
    udot_nom = Cc*xcdot_nom;

    alpha = direction_aware_alpha(u,udot_nom,umax,sigma_bar,q);

    dxp = Ap*xp + Bp*u;
    dxc = alpha*xcdot_nom;

    dx = [dxp; dxc];
end

function sig = reconstruct_signals(t,x,Ap,Bp,Cp,Ac,Bc,Cc,umax,sigma_bar,q,np,nc,use_ts)
    N = length(t);
    sig.r = zeros(N,1);
    sig.y = zeros(N,1);
    sig.e = zeros(N,1);
    sig.u_raw = zeros(N,1);
    sig.u_sat = zeros(N,1);
    sig.alpha = ones(N,1);
    sig.udot_nom = zeros(N,1);
    sig.margin = zeros(N,1);

    for k = 1:N
        xp = x(k,1:np).';
        xc = x(k,np+1:np+nc).';

        sig.r(k) = reference_signal(t(k));
        sig.y(k) = Cp*xp;
        sig.e(k) = sig.r(k) - sig.y(k);

        xcdot_nom = Ac*xc + Bc*sig.e(k);
        sig.u_raw(k) = Cc*xc;
        sig.u_sat(k) = min(max(sig.u_raw(k),-umax),umax);
        sig.udot_nom(k) = Cc*xcdot_nom;
        sig.margin(k) = umax - abs(sig.u_raw(k));

        if use_ts
            sig.alpha(k) = direction_aware_alpha(sig.u_raw(k),sig.udot_nom(k),umax,sigma_bar,q);
        else
            sig.alpha(k) = 1.0;
        end
    end
end

function alpha = direction_aware_alpha(u,udot_nom,umax,sigma_bar,q)
    % Direction-aware temporal scaling for -umax <= u <= umax.
    %
    % Upper bound is relevant only when udot_nom > 0.
    % Lower bound is relevant only when udot_nom < 0.
    sigma_upper = max(umax - u, 0);
    sigma_lower = max(umax + u, 0);

    alpha_upper = 1.0;
    alpha_lower = 1.0;

    if udot_nom > 0
        alpha_upper = boundary_profile(sigma_upper, sigma_bar, q);
    end

    if udot_nom < 0
        alpha_lower = boundary_profile(sigma_lower, sigma_bar, q);
    end

    alpha = min(alpha_upper, alpha_lower);
end

function alpha_b = boundary_profile(sigma, sigma_bar, q)
    if sigma >= sigma_bar
        alpha_b = 1.0;
    else
        alpha_b = (sigma/sigma_bar)^q;
    end
end

function r = reference_signal(t)
    % Pseudo-square-wave reference, amplitude 3.0, period 20 s.
    %
    % Why this shape maximises the windup gap:
    %   Max achievable output = umax / |a_plant| = 0.8 / 0.4 = 2.0.
    %   Reference amplitude 3.0 > 2.0, so the system is in persistent
    %   saturation during each 10-second half-period.  The hard-limited
    %   integrator winds up continuously.  At each polarity reversal the
    %   wound-up state must unwind before the output can reverse, producing
    %   large tracking errors lasting several seconds.  The TS integrator is
    %   frozen at the boundary, so it responds immediately with no windup.
    %
    % tanh shaping avoids a discontinuous derivative while keeping the
    % transition short enough that the reference looks like a square wave
    % in the plots.
    r_amp  = 3.0;   % exceeds max achievable output (2.0)
    T_half = 10;    % half-period in seconds  =>  period = 20 s
    r = r_amp * tanh(12 * sin(pi * t / T_half));
end
