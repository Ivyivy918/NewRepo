# Visual Studio 2022 馬力歐遊戲開發環境完整安裝指南

> 適用於 Windows + Visual Studio 2022 + C++
>
> 更新日期：2025-11-16

---

## 📋 目錄

1. [需要下載的軟件](#需要下載的軟件)
2. [Visual Studio 2022 安裝與配置](#visual-studio-2022-安裝與配置)
3. [EGE 圖形庫安裝](#ege-圖形庫安裝)
4. [下載馬力歐遊戲原始碼](#下載馬力歐遊戲原始碼)
5. [在 Visual Studio 中開啟專案](#在-visual-studio-中開啟專案)
6. [編譯與執行遊戲](#編譯與執行遊戲)
7. [常見問題排除](#常見問題排除)

---

## 📦 需要下載的軟件

### 1️⃣ Visual Studio 2022 Community（免費）

**下載連結**：https://visualstudio.microsoft.com/zh-hant/downloads/

- 選擇 **Visual Studio 2022 Community** 版本（免費）
- 檔案大小：約 3-4 GB（完整安裝）

**必須安裝的工作負載**：
- ✅ 使用 C++ 的桌面開發

### 2️⃣ EGE 圖形庫（Easy Graphics Engine）

**下載連結**：https://xege.org/ 或 https://github.com/wysaid/xege

EGE 是一個基於 Windows GDI 的簡易圖形庫，專為 C++ 初學者設計。

**版本要求**：
- EGE 19.01 或更高版本
- 支援 Visual Studio 2022

### 3️⃣ Git for Windows（可選，用於下載原始碼）

**下載連結**：https://git-scm.com/download/win

或者直接從 GitHub 下載 ZIP 壓縮檔：
- 前往 https://github.com/ByteTuxiaobei/Mario
- 點擊綠色的 **Code** 按鈕
- 選擇 **Download ZIP**

---

## 🛠️ Visual Studio 2022 安裝與配置

### 步驟 1：下載安裝程式

1. 前往 https://visualstudio.microsoft.com/zh-hant/downloads/
2. 點擊 **Community 2022** 下的 **免費下載**
3. 執行下載的 `VisualStudioSetup.exe`

### 步驟 2：選擇工作負載

在 Visual Studio Installer 中：

1. 勾選 **「使用 C++ 的桌面開發」**
2. 在右側「安裝詳細資料」中確認包含：
   - ✅ MSVC v143 - VS 2022 C++ x64/x86 建置工具
   - ✅ Windows SDK（最新版本）
   - ✅ C++ CMake 工具
   - ✅ C++ ATL

3. 點擊右下角 **安裝**

### 步驟 3：等待安裝完成

- 安裝時間：約 20-40 分鐘（視網速而定）
- 安裝完成後可以關閉 Installer

---

## 🎨 EGE 圖形庫安裝

EGE 是這個馬力歐遊戲使用的圖形庫，必須正確安裝才能編譯和執行遊戲。

### 方法一：使用預編譯版本（推薦）

#### 步驟 1：下載 EGE

1. 前往 https://github.com/wysaid/xege/releases
2. 下載最新版本的 **ege-版本號.zip**（例如：ege-19.01.zip）
3. 解壓縮到一個固定位置，例如 `C:\ege\`

#### 步驟 2：配置 Visual Studio 專案

在每個使用 EGE 的專案中：

**A. 設置包含目錄**

1. 在 Visual Studio 中打開專案
2. 右鍵點擊專案名稱 → **屬性**
3. 選擇 **C/C++** → **一般**
4. 在「其他 Include 目錄」中添加：`C:\ege\include`

**B. 設置庫目錄**

1. 選擇 **連結器** → **一般**
2. 在「其他程式庫目錄」中添加：`C:\ege\lib`

**C. 添加依賴庫**

1. 選擇 **連結器** → **輸入**
2. 在「其他相依性」中添加：`graphics.lib`（Debug 模式）或 `graphics.lib`（Release 模式）

**D. 設置字元集**

1. 選擇 **進階**
2. 將「字元集」設為：**使用多位元組字元集**

### 方法二：直接將 EGE 檔案放入專案（簡易方法）

1. 將 EGE 的 `graphics.h` 複製到專案的 `include` 資料夾
2. 將 EGE 的 `graphics.lib` 複製到專案的 `lib` 資料夾
3. 將所需的 `.dll` 檔案複製到專案的輸出目錄

---

## 📥 下載馬力歐遊戲原始碼

### 方法一：使用 Git（推薦）

```bash
git clone https://github.com/ByteTuxiaobei/Mario.git
cd Mario
```

### 方法二：下載 ZIP

1. 前往 https://github.com/ByteTuxiaobei/Mario
2. 點擊綠色的 **Code** 按鈕
3. 選擇 **Download ZIP**
4. 解壓縮到你想要的位置（例如 `C:\Projects\Mario\`）

---

## 🎮 在 Visual Studio 中開啟專案

### 情況 A：專案已有 .sln 檔案

1. 打開 Visual Studio 2022
2. 點擊 **開啟專案或方案**
3. 瀏覽到解壓縮的 Mario 資料夾
4. 選擇 `.sln` 檔案（例如 `Mario.sln`）
5. 點擊 **開啟**

### 情況 B：需要自己建立專案

如果原始碼沒有 Visual Studio 專案檔：

#### 步驟 1：建立新專案

1. 打開 Visual Studio 2022
2. 選擇 **建立新專案**
3. 搜尋並選擇 **空白專案 (C++)**
4. 專案名稱：`MarioGame`
5. 位置：選擇你要存放的資料夾
6. 點擊 **建立**

#### 步驟 2：加入原始碼檔案

1. 在「方案總管」中，右鍵點擊 **原始程式檔** 資料夾
2. 選擇 **新增** → **現有項目**
3. 選擇所有 `.cpp` 檔案並加入
4. 重複步驟，在 **標頭檔** 資料夾中加入所有 `.h` 檔案

#### 步驟 3：加入資源檔

1. 在專案根目錄建立 `resources` 資料夾
2. 將遊戲的圖片、音效等資源檔案複製進去
3. 同樣處理 `level_data` 資料夾

---

## ▶️ 編譯與執行遊戲

### 步驟 1：選擇組態

在 Visual Studio 上方工具列：
- **組態**：選擇 `Debug` 或 `Release`
- **平台**：選擇 `x64` 或 `x86`（根據你的系統）

### 步驟 2：建置專案

1. 點擊 **建置** → **建置方案**（或按 `Ctrl+Shift+B`）
2. 查看「輸出」視窗，確認沒有錯誤

### 步驟 3：執行遊戲

1. 點擊 **偵錯** → **開始偵錯**（或按 `F5`）
2. 或點擊 **開始執行但不偵錯**（`Ctrl+F5`）

### 步驟 4：確認資源檔路徑

如果遊戲啟動後無法載入圖片或音效：

1. 確保 `resources/` 和 `level_data/` 資料夾在執行檔同一目錄
2. 檢查程式碼中的路徑是否正確
3. 可能需要將資源複製到 `Debug/` 或 `Release/` 輸出目錄

---

## 🛠️ 常見問題排除

### ❌ 問題 1：找不到 `graphics.h`

**錯誤訊息**：
```
fatal error C1083: 無法開啟 Include 檔案: 'graphics.h'
```

**解決方法**：
1. 確認 EGE 已正確安裝
2. 檢查專案屬性中的「其他 Include 目錄」是否設置正確
3. 路徑應該指向 EGE 的 `include` 資料夾

### ❌ 問題 2：無法解析的外部符號

**錯誤訊息**：
```
LNK2019: 無法解析的外部符號
```

**解決方法**：
1. 確認已在「連結器」→「輸入」中添加 `graphics.lib`
2. 檢查「其他程式庫目錄」是否正確指向 EGE 的 `lib` 資料夾
3. 確認使用的是正確的 lib 檔案（x86 或 x64）

### ❌ 問題 3：字元集錯誤

**錯誤訊息**：
```
error C2664: 無法從 'const char [...]' 轉換為 'LPCWSTR'
```

**解決方法**：
1. 專案屬性 → **進階**
2. 將「字元集」改為 **使用多位元組字元集**

### ❌ 問題 4：遊戲視窗打開但顯示黑屏

**可能原因**：
- 資源檔案路徑錯誤
- 圖片格式不支援

**解決方法**：
1. 確認 `resources/` 資料夾在執行檔同一目錄
2. 檢查 `graphics.txt` 中的路徑設置
3. 查看 Visual Studio 的「輸出」視窗，看是否有載入錯誤

### ❌ 問題 5：找不到 DLL 檔案

**錯誤訊息**：
```
找不到 XXX.dll，程式無法啟動
```

**解決方法**：
1. 將 EGE 的 `.dll` 檔案複製到執行檔目錄
2. 或將 EGE 的 `bin` 目錄加入系統 PATH

---

## 📚 其他建議

### 建議的專案結構

```
MarioGame/
├── Mario.sln              # Visual Studio 方案檔
├── Mario.vcxproj          # 專案檔
├── src/                   # 原始碼
│   ├── main.cpp
│   ├── mario.cpp
│   ├── mario.h
│   └── ...
├── include/               # 標頭檔（如果分離）
├── resources/             # 遊戲資源
│   ├── images/
│   ├── sounds/
│   └── graphics.txt
├── level_data/            # 關卡資料
│   └── *.mio
├── Debug/                 # Debug 輸出目錄（自動生成）
└── Release/               # Release 輸出目錄（自動生成）
```

### 編譯優化建議

**Debug 模式**：
- 用於開發和除錯
- 包含除錯符號
- 執行速度較慢

**Release 模式**：
- 用於最終發布
- 啟用優化
- 檔案較小，執行速度快

建議在 Release 模式下設置：
1. 專案屬性 → **C/C++** → **優化**
2. 將「優化」設為 **最大優化 (偏好速度) /O2**

---

## ✅ 快速檢查清單

在開始開發前，確認：

- [ ] Visual Studio 2022 已安裝並包含「C++ 桌面開發」工作負載
- [ ] EGE 圖形庫已下載並正確配置
- [ ] 馬力歐遊戲原始碼已下載
- [ ] 專案在 Visual Studio 中成功開啟
- [ ] 專案屬性中的 Include 和 Lib 目錄已正確設置
- [ ] 字元集設為「多位元組字元集」
- [ ] 資源檔案（圖片、音效）已複製到正確位置
- [ ] 專案可以成功建置（沒有錯誤）
- [ ] 遊戲可以正常執行

---

## 🎯 下一步

完成環境設置後，請參考：
- [遊戲繁體中文化指南](./CHINESE_LOCALIZATION.md) - 將遊戲介面改為繁體中文
- [馬力歐遊戲分析報告](./MARIO_GAME_ANALYSIS.md) - 了解遊戲架構

---

**需要幫助？**

如果遇到問題：
1. 查看本文的「常見問題排除」章節
2. 檢查 Visual Studio 的「輸出」和「錯誤清單」視窗
3. 確認所有路徑設置正確
4. 查看 EGE 官方文檔：https://xege.org/

祝你開發順利！🎮
