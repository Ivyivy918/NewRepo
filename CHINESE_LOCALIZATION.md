# 馬力歐遊戲繁體中文化完整指南

> 將遊戲介面、選單、提示文字等全部改為繁體中文
>
> 更新日期：2025-11-16

---

## 📋 目錄

1. [概述](#概述)
2. [需要修改的檔案類型](#需要修改的檔案類型)
3. [C++ 原始碼中的文字修改](#c-原始碼中的文字修改)
4. [UI 介面文字修改](#ui-介面文字修改)
5. [Visual Studio 字元編碼設置](#visual-studio-字元編碼設置)
6. [常見繁體中文術語對照表](#常見繁體中文術語對照表)
7. [完整修改範例](#完整修改範例)
8. [測試與驗證](#測試與驗證)

---

## 🎯 概述

這個馬力歐遊戲可能包含：
- 英文介面文字
- 簡體中文註解
- 選單文字
- 遊戲提示訊息
- 計分板文字

我們將全部改為**繁體中文**，確保台灣玩家能順利理解。

---

## 📂 需要修改的檔案類型

### 1️⃣ C++ 原始碼檔案 (.cpp, .h)

包含遊戲邏輯中的字串常量，例如：

```cpp
// 原本可能是英文或簡體中文
cout << "Game Over" << endl;
string menuTitle = "选择关卡";  // 簡體中文

// 改為繁體中文
cout << "遊戲結束" << endl;
string menuTitle = "選擇關卡";  // 繁體中文
```

### 2️⃣ 資源檔案

- **graphics.txt** - 圖形資源配置
- **level_data/*.mio** - 關卡資料
- 可能包含關卡名稱、說明等文字

### 3️⃣ 圖片資源（需要重新製作）

如果遊戲中有包含文字的圖片（如按鈕、標題圖），需要：
- 使用圖片編輯軟體（Photoshop, GIMP）重新製作
- 或使用程式碼動態繪製文字

---

## 💻 C++ 原始碼中的文字修改

### 步驟 1：使用 Visual Studio 全域搜尋

1. 打開 Visual Studio 2022
2. 按 `Ctrl + Shift + F` 開啟「在檔案中尋找」
3. 搜尋關鍵字：
   - 英文關鍵字：`"Score"`, `"Game"`, `"Level"`, `"Start"`, `"Exit"` 等
   - 簡體中文：`"选择"`, `"开始"`, `"结束"`, `"关卡"` 等

### 步驟 2：識別需要修改的字串

常見的遊戲文字位置：

#### A. 選單系統 (menu.cpp/h)

```cpp
// 找到類似的程式碼並修改

// ❌ 修改前（英文）
const char* menuItems[] = {
    "Start Game",
    "Select Level",
    "Settings",
    "Exit"
};

// ✅ 修改後（繁體中文）
const char* menuItems[] = {
    "開始遊戲",
    "選擇關卡",
    "設定",
    "離開"
};
```

#### B. HUD 顯示 (headers.cpp/h)

```cpp
// ❌ 修改前
drawText("Score: " + to_string(score), 10, 10);
drawText("Coins: " + to_string(coins), 10, 30);
drawText("Time: " + to_string(timeLeft), 10, 50);
drawText("Level: " + levelName, 10, 70);

// ✅ 修改後（繁體中文）
drawText("分數：" + to_string(score), 10, 10);
drawText("金幣：" + to_string(coins), 10, 30);
drawText("時間：" + to_string(timeLeft), 10, 50);
drawText("關卡：" + levelName, 10, 70);
```

#### C. 遊戲訊息 (global.cpp 或 main.cpp)

```cpp
// ❌ 修改前
if (gameOver) {
    showMessage("Game Over!");
}
if (levelComplete) {
    showMessage("Level Complete!");
}

// ✅ 修改後（繁體中文）
if (gameOver) {
    showMessage("遊戲結束！");
}
if (levelComplete) {
    showMessage("過關！");
}
```

#### D. 按鈕提示

```cpp
// ❌ 修改前
const char* controls[] = {
    "Arrow Keys: Move",
    "Space: Jump",
    "Shift: Run",
    "F: Fire"
};

// ✅ 修改後（繁體中文）
const char* controls[] = {
    "方向鍵：移動",
    "空白鍵：跳躍",
    "Shift：衝刺",
    "F：發射火球"
};
```

---

## 🎨 UI 介面文字修改

### 修改選單介面

假設 `menu.cpp` 中有選單繪製函數：

```cpp
// 在 menu.cpp 中找到選單繪製函數

void drawMainMenu() {
    // ❌ 修改前
    drawText("SUPER MARIO", windowWidth/2, 100);
    drawButton("START", windowWidth/2, 200);
    drawButton("OPTIONS", windowWidth/2, 250);
    drawButton("QUIT", windowWidth/2, 300);

    // ✅ 修改後（繁體中文）
    drawText("超級瑪利歐", windowWidth/2, 100);
    drawButton("開始", windowWidth/2, 200);
    drawButton("選項", windowWidth/2, 250);
    drawButton("結束", windowWidth/2, 300);
}
```

### 修改加載畫面

在 `load_screen.cpp` 中：

```cpp
void showLoadingScreen() {
    // ❌ 修改前
    drawText("Loading...", windowWidth/2, windowHeight/2);
    drawText("Please Wait", windowWidth/2, windowHeight/2 + 30);

    // ✅ 修改後（繁體中文）
    drawText("載入中...", windowWidth/2, windowHeight/2);
    drawText("請稍候", windowWidth/2, windowHeight/2 + 30);
}
```

---

## ⚙️ Visual Studio 字元編碼設置

### 重要：確保繁體中文正確顯示

#### 步驟 1：設置原始檔編碼

1. 在 Visual Studio 中打開 `.cpp` 或 `.h` 檔案
2. 點擊 **檔案** → **另存新檔為進階儲存選項**
3. 編碼選擇：
   - **UTF-8 含簽章 (UTF-8 with BOM)** - 推薦
   - 或 **繁體中文 (Big5)** - 如果 UTF-8 有問題

#### 步驟 2：專案字元集設置

1. 右鍵點擊專案 → **屬性**
2. **組態屬性** → **進階**
3. **字元集** 選擇：
   - **使用 Unicode 字元集** - 推薦，支援所有語言
   - 或 **使用多位元組字元集** - 適用於 Big5

#### 步驟 3：添加編譯器指令（如需要）

在使用中文字串的 .cpp 檔案開頭加入：

```cpp
#pragma execution_character_set("utf-8")  // 確保字串使用 UTF-8 編碼

#include <windows.h>
#include "graphics.h"
#include <iostream>

// 在 main 函數開頭設置控制台編碼
int main() {
    SetConsoleOutputCP(CP_UTF8);  // 設置控制台輸出為 UTF-8
    SetConsoleCP(CP_UTF8);         // 設置控制台輸入為 UTF-8

    // 遊戲初始化...
}
```

---

## 📚 常見繁體中文術語對照表

### 遊戲核心術語

| 英文/簡體 | 繁體中文 |
|-----------|----------|
| Game | 遊戲 |
| Start | 開始 |
| Continue | 繼續 |
| Pause | 暫停 |
| Resume | 恢復 |
| Quit / Exit | 離開 / 結束 |
| Menu | 選單 |
| Settings / Options | 設定 / 選項 |
| Help | 說明 / 幫助 |
| About | 關於 |

### 馬力歐遊戲專用術語

| 英文/簡體 | 繁體中文 |
|-----------|----------|
| Mario | 瑪利歐 |
| Level | 關卡 |
| World | 世界 |
| Score | 分數 |
| Coins | 金幣 |
| Lives | 生命 |
| Time | 時間 |
| Game Over | 遊戲結束 |
| You Win! | 你贏了！ |
| Try Again | 再試一次 |
| Stage Clear | 過關 |
| Checkpoint | 檢查點 |

### 角色與道具

| 英文/簡體 | 繁體中文 |
|-----------|----------|
| Player | 玩家 |
| Enemy | 敵人 |
| Mushroom | 蘑菇 |
| Fire Flower | 火焰花 |
| Star | 無敵星 |
| Coin | 金幣 |
| Brick | 磚塊 |
| Question Block | 問號磚 |
| Pipe | 水管 |
| Flagpole | 旗杆 |
| Goomba | 栗寶寶 / 板栗怪 |
| Koopa / Turtle | 龜殼 / 烏龜 |

### 操作說明

| 英文/簡體 | 繁體中文 |
|-----------|----------|
| Move | 移動 |
| Jump | 跳躍 |
| Run | 奔跑 / 衝刺 |
| Fire | 發射 |
| Arrow Keys | 方向鍵 |
| Space | 空白鍵 |
| Enter | Enter 鍵 |
| ESC | ESC 鍵 |
| Press any key | 請按任意鍵 |

---

## 🔧 完整修改範例

### 範例 1：修改主選單 (menu.cpp)

```cpp
// ===== menu.cpp =====

#pragma execution_character_set("utf-8")

#include "menu.h"
#include "graphics.h"

class MainMenu {
private:
    // 繁體中文選單項目
    const wchar_t* menuItems[4] = {
        L"開始遊戲",
        L"選擇關卡",
        L"遊戲設定",
        L"離開遊戲"
    };

    int selectedIndex = 0;

public:
    void draw() {
        // 標題
        drawText(L"超級瑪利歐", 400, 100, 48);

        // 選單項目
        for (int i = 0; i < 4; i++) {
            if (i == selectedIndex) {
                setColor(YELLOW);  // 選中項目高亮
            } else {
                setColor(WHITE);
            }
            drawText(menuItems[i], 400, 200 + i * 50, 24);
        }

        // 底部提示
        setColor(GRAY);
        drawText(L"使用方向鍵選擇，Enter 確認", 400, 500, 16);
    }

    void handleInput() {
        if (keyPressed(VK_UP)) {
            selectedIndex = max(0, selectedIndex - 1);
        }
        if (keyPressed(VK_DOWN)) {
            selectedIndex = min(3, selectedIndex + 1);
        }
        if (keyPressed(VK_RETURN)) {
            executeMenuItem(selectedIndex);
        }
    }
};
```

### 範例 2：修改 HUD 顯示 (headers.cpp)

```cpp
// ===== headers.cpp =====

#pragma execution_character_set("utf-8")

#include "headers.h"

void drawHUD(int score, int coins, int time, const wchar_t* levelName) {
    setColor(WHITE);
    setFont(20, 0, L"微軟正黑體");  // 使用繁體中文友好字型

    // 左上角資訊
    wchar_t buffer[256];

    // 分數
    swprintf(buffer, 256, L"分數：%d", score);
    outtextxy(20, 20, buffer);

    // 金幣
    swprintf(buffer, 256, L"金幣：%d", coins);
    outtextxy(20, 50, buffer);

    // 時間
    swprintf(buffer, 256, L"時間：%d", time);
    outtextxy(20, 80, buffer);

    // 關卡名稱
    swprintf(buffer, 256, L"關卡：%s", levelName);
    outtextxy(20, 110, buffer);
}
```

### 範例 3：修改遊戲訊息 (main.cpp)

```cpp
// ===== main.cpp =====

#pragma execution_character_set("utf-8")

#include <windows.h>
#include "global.h"

void showGameMessage(GameState state) {
    setColor(WHITE);
    setFont(36, 0, L"微軟正黑體");

    switch (state) {
        case GAME_OVER:
            drawCenterText(L"遊戲結束", screenHeight / 2);
            drawCenterText(L"按 R 重新開始", screenHeight / 2 + 50);
            break;

        case LEVEL_COMPLETE:
            drawCenterText(L"過關！", screenHeight / 2);
            drawCenterText(L"按 Enter 繼續", screenHeight / 2 + 50);
            break;

        case PAUSED:
            drawCenterText(L"暫停", screenHeight / 2);
            drawCenterText(L"按 P 繼續遊戲", screenHeight / 2 + 50);
            break;
    }
}

int main() {
    // 設置控制台為 UTF-8
    SetConsoleOutputCP(CP_UTF8);
    SetConsoleCP(CP_UTF8);

    // 初始化視窗
    initgraph(800, 600);
    setbkcolor(BLACK);

    // 遊戲迴圈...
    while (running) {
        // 遊戲邏輯...
        showGameMessage(currentState);
    }

    closegraph();
    return 0;
}
```

### 範例 4：修改操作說明

```cpp
// ===== 操作說明畫面 =====

void showControlsHelp() {
    setColor(WHITE);
    setFont(24, 0, L"微軟正黑體");

    drawCenterText(L"遊戲操作說明", 100);

    setFont(18, 0, L"微軟正黑體");
    const wchar_t* controls[] = {
        L"← →      左右移動",
        L"Space    跳躍",
        L"Shift    衝刺奔跑",
        L"F        發射火球（火焰瑪利歐）",
        L"P        暫停遊戲",
        L"ESC      返回選單",
        L"R        重新開始"
    };

    int y = 200;
    for (int i = 0; i < 7; i++) {
        outtextxy(200, y, controls[i]);
        y += 40;
    }

    setColor(YELLOW);
    drawCenterText(L"按 ESC 返回", 550);
}
```

---

## ✅ 測試與驗證

### 步驟 1：編譯測試

1. 完成文字修改後，按 `Ctrl+Shift+B` 建置專案
2. 查看「錯誤清單」，確認沒有編碼相關錯誤

### 步驟 2：執行測試

1. 按 `F5` 執行遊戲
2. 檢查所有介面文字：
   - [ ] 主選單文字正確顯示
   - [ ] HUD 資訊（分數、金幣等）顯示正確
   - [ ] 遊戲訊息（Game Over 等）顯示正確
   - [ ] 操作說明文字完整
   - [ ] 沒有出現亂碼

### 步驟 3：字型測試

如果繁體中文顯示為方塊或亂碼：

```cpp
// 嘗試更換字型
setFont(20, 0, L"微軟正黑體");    // Windows 內建
// 或
setFont(20, 0, L"新細明體");
// 或
setFont(20, 0, L"標楷體");
```

---

## 🚨 常見問題

### ❌ 問題 1：中文顯示亂碼

**解決方法**：
1. 確認檔案存為 UTF-8 編碼
2. 在檔案開頭添加：`#pragma execution_character_set("utf-8")`
3. 使用 `wchar_t` 和 `L"中文"` 格式
4. 在 main 函數開頭設置：`SetConsoleOutputCP(CP_UTF8);`

### ❌ 問題 2：編譯錯誤「無法轉換字元」

**解決方法**：
- 將 `char*` 改為 `wchar_t*`
- 將 `"文字"` 改為 `L"文字"`
- 使用 `wprintf` 而非 `printf`

### ❌ 問題 3：中文變成問號 ???

**解決方法**：
- 檢查字型是否支援中文
- 確認使用 `outtextxy` 而非 `drawtext`
- 使用寬字元版本的函數

---

## 📋 完整修改檢查清單

- [ ] 主選單文字改為繁體中文
- [ ] 選關介面文字改為繁體中文
- [ ] HUD 顯示（分數、金幣、時間）改為繁體中文
- [ ] 遊戲訊息（Game Over、過關等）改為繁體中文
- [ ] 操作說明改為繁體中文
- [ ] 設定選單改為繁體中文
- [ ] 關卡名稱改為繁體中文
- [ ] 所有原始碼註解改為繁體中文
- [ ] 檔案編碼設為 UTF-8
- [ ] 專案字元集正確設置
- [ ] 編譯無錯誤
- [ ] 執行測試通過，文字正確顯示

---

## 🎯 總結

完成繁體中文化後，你的遊戲將：
- ✅ 所有介面文字為繁體中文
- ✅ 沒有亂碼或顯示錯誤
- ✅ 更適合台灣玩家使用
- ✅ 程式碼註解也是繁體中文，方便理解

**下一步**：開始實際修改你的馬力歐遊戲原始碼吧！🎮

---

**參考資源**：
- [Visual Studio 2022 環境設置指南](./SETUP_GUIDE_VS2022.md)
- [馬力歐遊戲分析報告](./MARIO_GAME_ANALYSIS.md)
