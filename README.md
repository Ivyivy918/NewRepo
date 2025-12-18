# 馬力歐遊戲專題研究

這個 repository 包含對 [ByteTuxiaobei/Mario](https://github.com/ByteTuxiaobei/Mario) 專案的詳細分析，以及完整的 **Windows + Visual Studio 2022 + C++** 開發環境建置指南。

---

## 🚀 快速開始

### 新手推薦：從這裡開始！

👉 **[QUICK_START.md](./QUICK_START.md)** - 6 步驟快速開始指南

從零開始到執行遊戲，包含：
- 需要下載的軟件清單
- Visual Studio 2022 安裝步驟
- EGE 圖形庫配置
- 編譯與執行遊戲
- 完整檢查清單

---

## 📄 完整文檔

### 1️⃣ [MARIO_GAME_ANALYSIS.md](./MARIO_GAME_ANALYSIS.md)

**馬力歐遊戲專題分析報告**，包含：

- 🎮 遊戲功能實現度分析（完成度 80-85%）
- 📁 專案架構詳細說明（13個角色類）
- 🎯 已實現功能清單
- 💡 C/C++ 遊戲開發建議
- 📚 學習路徑規劃
- ⚡ 快速開始範例代碼
- 📊 工作量評估

### 2️⃣ [SETUP_GUIDE_VS2022.md](./SETUP_GUIDE_VS2022.md)

**Visual Studio 2022 完整環境配置指南**，包含：

- 📦 所有需要下載的軟件與連結
- 🛠️ Visual Studio 2022 詳細安裝步驟
- 🎨 EGE 圖形庫安裝與配置
- 📥 下載並開啟馬力歐專案
- ▶️ 編譯與執行遊戲
- 🛠️ 常見問題完整排除指南

### 3️⃣ [CHINESE_LOCALIZATION.md](./CHINESE_LOCALIZATION.md)

**遊戲繁體中文化完整指南**，包含：

- 🌏 如何將遊戲介面改為繁體中文
- 💻 C++ 原始碼文字修改方法
- ⚙️ Visual Studio 字元編碼設置
- 📚 遊戲術語繁體中文對照表
- 🔧 完整程式碼修改範例
- ✅ 測試與驗證步驟

## 🎯 專題目標

了解如何使用 C/C++ 開發一款經典的橫向卷軸平台遊戲，包括：

- 角色控制與物理引擎
- 碰撞檢測系統
- 敵人 AI
- 道具系統
- 關卡設計

---

## 🔧 技術重點

### 本專案使用（推薦）：
- **作業系統**：Windows 10/11
- **開發工具**：Visual Studio 2022 Community（免費）
- **程式語言**：C++14
- **圖形庫**：EGE (Easy Graphics Engine)

### 替代方案（純 C 語言）：
如果期末專題必須使用純 C 語言：
- **SDL2** - 最流行的跨平台多媒體庫
- **Raylib** - 簡單易學的遊戲開發庫

---

## 📖 建議學習流程

### 第一階段：環境建置（第 1 天）
1. ✅ 閱讀 **[快速開始指南](./QUICK_START.md)**
2. ✅ 下載並安裝 Visual Studio 2022
3. ✅ 下載 EGE 圖形庫
4. ✅ 下載馬力歐遊戲原始碼
5. ✅ 配置專案並成功編譯

### 第二階段：遊戲分析（第 2-3 天）
1. 📖 執行遊戲，體驗所有功能
2. 📖 閱讀 **[遊戲分析報告](./MARIO_GAME_ANALYSIS.md)**
3. 📖 了解專案架構與檔案結構
4. 📖 研究核心系統（物理引擎、碰撞檢測）

### 第三階段：繁體中文化（第 4-5 天）
1. 🌏 閱讀 **[繁體中文化指南](./CHINESE_LOCALIZATION.md)**
2. 🌏 修改選單與介面文字
3. 🌏 設置正確的字元編碼
4. 🌏 測試所有文字顯示

### 第四階段：自訂開發（第 6-7 天以後）
1. ✨ 修改遊戲參數（速度、跳躍高度等）
2. ✨ 添加新功能或道具
3. ✨ 設計自己的關卡
4. ✨ 優化與除錯

---

## 📦 需要下載的軟件

| 軟件 | 用途 | 下載連結 | 必須？ |
|------|------|----------|--------|
| Visual Studio 2022 Community | 開發環境 | [官網下載](https://visualstudio.microsoft.com/zh-hant/downloads/) | ✅ 必須 |
| EGE 圖形庫 | 遊戲圖形引擎 | [GitHub](https://github.com/wysaid/xege/releases) | ✅ 必須 |
| 馬力歐遊戲原始碼 | 遊戲程式碼 | [GitHub](https://github.com/ByteTuxiaobei/Mario) | ✅ 必須 |
| Git for Windows | 版本控制（可選） | [官網](https://git-scm.com/download/win) | ⭕ 可選 |

---

## 🎓 適用對象

- ✅ Windows 系統使用者
- ✅ C/C++ 遊戲開發初學者
- ✅ 需要期末專題參考的學生
- ✅ 使用 Visual Studio 的開發者
- ✅ 對經典遊戲開發感興趣的人

---

## ❓ 常見問題

### Q1：我一定要用 Visual Studio 2022 嗎？
**A**：推薦使用 VS 2022，但 VS 2019 也可以。其他 IDE（如 Code::Blocks, Dev-C++）需要自行配置 EGE。

### Q2：EGE 圖形庫是什麼？
**A**：EGE (Easy Graphics Engine) 是一個基於 Windows GDI 的簡易圖形庫，專為 C++ 初學者設計，API 簡單易學。

### Q3：可以在 Mac 或 Linux 上開發嗎？
**A**：EGE 是 Windows 專用的。如果要跨平台，建議改用 SDL2 或 Raylib，但需要重寫圖形相關程式碼。

### Q4：我的專題必須用純 C 語言怎麼辦？
**A**：請參考 [遊戲分析報告](./MARIO_GAME_ANALYSIS.md) 中的「C 語言改寫建議」章節，或使用 SDL2/Raylib 重新開發。

### Q5：繁體中文化會很難嗎？
**A**：不會！按照 [繁體中文化指南](./CHINESE_LOCALIZATION.md) 的步驟，主要是搜尋替換文字字串，預估 2-3 小時可完成。

### Q6：這個遊戲完成度如何？
**A**：約 80-85% 完成度，核心玩法完整，包含主角、敵人、道具、物理引擎、計分系統等。詳見 [分析報告](./MARIO_GAME_ANALYSIS.md)。

---

## 📊 專案統計

- **總文件數**：約 30+ 個 .cpp/.h 檔案
- **程式碼行數**：預估 3000-5000 行
- **已實現角色類別**：13 個（主角、敵人、道具、場景物件）
- **核心系統**：6 個（渲染、輸入、音樂、物理、碰撞、UI）
- **遊戲完成度**：80-85%

---

## 🚀 開始你的馬力歐開發之旅！

1. 📖 先閱讀 **[快速開始指南](./QUICK_START.md)** （推薦！）
2. 🛠️ 或查看 **[完整環境配置](./SETUP_GUIDE_VS2022.md)**
3. 🎮 了解遊戲架構：**[遊戲分析報告](./MARIO_GAME_ANALYSIS.md)**
4. 🌏 繁體中文化：**[中文化指南](./CHINESE_LOCALIZATION.md)**

---

## 📝 文檔更新記錄

- **2025-11-16**：
  - ✅ 新增馬力歐遊戲分析報告
  - ✅ 新增 Visual Studio 2022 完整配置指南
  - ✅ 新增繁體中文化完整指南
  - ✅ 新增快速開始指南
  - ✅ 更新 README 為繁體中文

---

## 📄 授權說明

- 本 Repository 的文檔（分析報告、指南等）：自由使用
- ByteTuxiaobei/Mario 原專案：遵循 GPL-3.0 授權

---

**創建日期**：2025-11-16
**分析專案**：[ByteTuxiaobei/Mario](https://github.com/ByteTuxiaobei/Mario)
**適用平台**：Windows 10/11 + Visual Studio 2022 + C++

---

**祝你開發順利！** 🎮🍄⭐

有任何問題歡迎參考各個詳細指南文檔。
