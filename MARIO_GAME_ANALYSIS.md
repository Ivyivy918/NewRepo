# 馬力歐遊戲專題分析報告

> 項目來源：[ByteTuxiaobei/Mario](https://github.com/ByteTuxiaobei/Mario)
>
> 分析日期：2025-11-16

---

## 📋 專案概述

這是一個使用 **C++14** 開發的超級馬力歐遊戲克隆項目，使用 **EGE (Easy Graphics Engine)** 圖形庫實現。

### 開發環境
- **程式語言**：C++14
- **圖形庫**：Easy Graphics Engine (EGE)
- **開發工具**：Microsoft Visual Studio Community 2022 (64位)
- **授權協議**：GPL-3.0

---

## 🎮 遊戲功能實現度分析

### ✅ 已完成功能

#### 1. 核心遊戲系統
- ✅ 遊戲主循環與渲染系統
- ✅ 鍵盤輸入處理系統
- ✅ 背景音樂播放控制
- ✅ 攝像機/視角控制
- ✅ 關卡數據讀取系統
- ✅ 計分與時間系統

#### 2. 物理引擎
- ✅ 碰撞箱系統 (Collider)
- ✅ 物理引擎基礎類
- ✅ 重力與跳躍機制
- ✅ 碰撞檢測算法

#### 3. 主角系統 (Mario)
- ✅ 基本移動（左右移動）
- ✅ 跳躍機制
- ✅ 長按衝刺
- ✅ 火焰馬力歐狀態
- ✅ 火球發射機制
- ✅ 角色狀態轉換（小馬力歐 → 大馬力歐 → 火焰馬力歐）
- ✅ 死亡動畫

#### 4. 敵人系統（共3種）
- ✅ **板栗怪 (Chestnut)** - 基礎敵人
- ✅ **烏龜 (Tortoise)** - 可踩踏並踢出龜殼
- ✅ **蘑菇 (Mushroom)** - 道具敵人

#### 5. 道具系統
- ✅ **金幣 (Coin)** - 收集得分
- ✅ **火焰花 (Flower)** - 獲得火焰能力
- ✅ **無敵星 (Star)** - 無敵狀態
- ✅ **問號磚 (Question Block)** - 可互動方塊

#### 6. 場景元素
- ✅ 標準磚塊 (Brick) - 可破壞
- ✅ 靜態磚塊 (Freeze Block) - 不可破壞
- ✅ 終點旗杆 (Flagpole) - 關卡結束機制

#### 7. UI 與頁面系統
- ✅ 主菜單界面
- ✅ 選關界面
- ✅ 加載畫面
- ✅ HUD 顯示（分數、金幣數、關卡名稱、剩餘時間）

#### 8. 特效與動畫
- ✅ 角色死亡動畫
- ✅ 得分動畫效果
- ✅ 道具出現動畫

#### 9. 關卡編輯系統
- ✅ 自訂關卡格式 (`.mio` 檔案)
- ✅ 素材命令系統
- ✅ 關卡數據讀取器

#### 10. 調試功能
- ✅ 碰撞箱視覺化
- ✅ 物理資訊顯示

---

## 📁 專案架構分析

### 核心系統文件

| 文件名 | 功能說明 |
|--------|----------|
| `main.cpp/h` | 程序入口、初始化與主循環 |
| `global.cpp/h` | 全局變量與函數定義 |
| `keymsg.cpp/h` | 鍵盤輸入事件處理 |
| `musicplayer.cpp/h` | 背景音樂與音效控制 |
| `camera.cpp/h` | 圖形渲染與攝像機控制 |
| `headers.cpp/h` | HUD 界面（分數、時間等） |

### 界面系統

| 文件名 | 功能說明 |
|--------|----------|
| `menu.cpp/h` | 主菜單與選關界面 |
| `load_screen.cpp/h` | 關卡加載畫面 |

### 物理引擎

| 文件名 | 功能說明 |
|--------|----------|
| `collider.cpp/h` | 碰撞箱基類與物理引擎核心 |

### 角色實現（13個類）

#### 主角
- `mario.cpp/h` - 馬力歐主角控制
- `mario_fire.cpp/h` - 火球投射物

#### 敵人（3種）
- `chestnut.cpp/h` - 板栗怪
- `tortoise.cpp/h` - 烏龜
- `mushroom.cpp/h` - 蘑菇敵人

#### 道具（3種）
- `coin.cpp/h` - 金幣
- `flower.cpp/h` - 火焰花
- `star.cpp/h` - 無敵星

#### 場景物件（4種）
- `brick.cpp/h` - 可破壞磚塊
- `freeze_block.cpp/h` - 靜態磚塊
- `question_block.cpp/h` - 問號磚
- `flagpole.cpp/h` - 終點旗杆

#### 特效
- `death_animation.cpp/h` - 死亡動畫
- `add_score.cpp/h` - 得分動畫

### 數據與資源

| 路徑/文件 | 說明 |
|-----------|------|
| `level_data/` | 關卡數據文件夾 (`.mio` 格式) |
| `resources/` | 圖片與音頻素材 |
| `graphics.txt` | 圖形素材位置配置 |
| `level.cpp/h` | 關卡讀取與管理 |

---

## 🎯 遊戲完成度評估

### 完成度：★★★★☆ (80-85%)

#### 優點
1. ✅ **核心玩法完整**：移動、跳躍、碰撞檢測都很完善
2. ✅ **敵人種類**：實現了經典的 3 種敵人
3. ✅ **道具系統**：金幣、火焰花、無敵星都有
4. ✅ **物理引擎**：碰撞檢測與物理運算已實現
5. ✅ **UI 系統**：菜單、HUD、加載畫面都很完整
6. ✅ **關卡編輯**：支援自訂關卡，擴展性強
7. ✅ **音效系統**：有背景音樂播放功能

#### 可能缺少的功能
- ⚠️ 更多敵人種類（食人花、飛魚等）
- ⚠️ 水下關卡
- ⚠️ 隱藏區域/管道系統
- ⚠️ 多人模式
- ⚠️ 存檔系統
- ⚠️ Boss 戰

---

## 💡 對於 C 語言期末專題的建議

### ⚠️ 重要提醒

**該專案使用的是 C++，不是 C 語言！**

如果你的期末專題必須使用 **純 C 語言**，有以下建議：

### 方案一：將 C++ 專案改寫為 C

**需要調整的部分：**
1. 移除類別（Class）→ 改用結構體（Struct）+ 函數指標
2. 移除命名空間（namespace）
3. 移除 C++ STL 容器（vector, string 等）→ 改用陣列或自行實現
4. 移除建構子/解構子 → 改用初始化/清理函數
5. 將 C++ 的引用（&）改為指標（*）

**範例轉換：**

```cpp
// C++ 版本
class Mario {
private:
    int x, y;
    int speed;
public:
    Mario(int startX, int startY);
    void move(int dx);
};
```

```c
// C 語言版本
typedef struct {
    int x, y;
    int speed;
} Mario;

// 初始化函數
void Mario_init(Mario* mario, int startX, int startY) {
    mario->x = startX;
    mario->y = startY;
    mario->speed = 5;
}

// 移動函數
void Mario_move(Mario* mario, int dx) {
    mario->x += dx * mario->speed;
}
```

### 方案二：使用 C 語言圖形庫重新開發

推薦的 C 語言圖形庫：

1. **SDL2** (Simple DirectMedia Layer)
   - ✅ 跨平台（Windows, Linux, macOS）
   - ✅ 純 C 語言 API
   - ✅ 支援圖形、音效、輸入
   - ✅ 文檔豐富，教程多

2. **Raylib**
   - ✅ 專為遊戲設計
   - ✅ 純 C 語言
   - ✅ 簡單易學
   - ✅ 內建物理引擎

3. **Allegro 5**
   - ✅ 老牌遊戲庫
   - ✅ 支援 C 語言
   - ✅ 功能完整

### 方案三：簡化版馬力歐遊戲

如果從頭開發，建議實現以下核心功能即可：

#### 最小可行產品 (MVP)
1. ✅ 主角左右移動 + 跳躍
2. ✅ 1-2 種敵人
3. ✅ 簡單的平台碰撞
4. ✅ 金幣收集
5. ✅ 計分系統
6. ✅ 一個完整關卡

#### 進階功能（加分項）
- 道具系統（變大蘑菇）
- 磚塊破壞
- 音效
- 多關卡
- 簡單動畫

---

## 📚 學習路徑建議

### 第一階段：基礎知識（1-2週）
1. 複習 C 語言結構體、指標、檔案 I/O
2. 學習選定的圖形庫（SDL2/Raylib）
3. 完成簡單範例：畫圖、顯示圖片、鍵盤輸入

### 第二階段：核心機制（2-3週）
1. 實現角色移動與跳躍
2. 實現重力與碰撞檢測
3. 繪製簡單地圖

### 第三階段：遊戲內容（2-3週）
1. 添加敵人與碰撞邏輯
2. 實現道具系統
3. 添加計分與 UI

### 第四階段：完善與測試（1週）
1. Bug 修復
2. 遊戲平衡調整
3. 撰寫文檔與報告

---

## 🔗 參考資源

### C 語言遊戲開發教程
- SDL2 官方文檔：https://wiki.libsdl.org/
- Raylib 官方網站：https://www.raylib.com/
- Lazy Foo' SDL 教程：https://lazyfoo.net/tutorials/SDL/

### 物理引擎參考
- 簡單 2D 碰撞檢測：AABB (軸對齊包圍盒)
- 重力加速度實現
- 跳躍拋物線計算

---

## ⚡ 快速開始建議

如果要用 C 語言做馬力歐遊戲，推薦使用 **Raylib**：

```c
#include "raylib.h"

typedef struct {
    Vector2 position;
    Vector2 velocity;
    bool onGround;
} Player;

int main(void) {
    InitWindow(800, 600, "Super Mario Clone");
    SetTargetFPS(60);

    Player mario = { {100, 400}, {0, 0}, false };

    while (!WindowShouldClose()) {
        // 更新
        if (IsKeyDown(KEY_RIGHT)) mario.velocity.x = 5;
        else if (IsKeyDown(KEY_LEFT)) mario.velocity.x = -5;
        else mario.velocity.x = 0;

        if (IsKeyPressed(KEY_SPACE) && mario.onGround) {
            mario.velocity.y = -15;
        }

        // 重力
        mario.velocity.y += 0.5f;
        mario.position.x += mario.velocity.x;
        mario.position.y += mario.velocity.y;

        // 地面碰撞
        if (mario.position.y >= 500) {
            mario.position.y = 500;
            mario.velocity.y = 0;
            mario.onGround = true;
        } else {
            mario.onGround = false;
        }

        // 繪製
        BeginDrawing();
            ClearBackground(RAYWHITE);
            DrawRectangle(mario.position.x, mario.position.y, 32, 32, RED);
            DrawRectangle(0, 532, 800, 68, GREEN); // 地面
        EndDrawing();
    }

    CloseWindow();
    return 0;
}
```

---

## 📊 工作量評估

| 任務 | 預估時間 | 難度 |
|------|----------|------|
| 圖形庫學習 | 3-5天 | ★★☆☆☆ |
| 角色移動與跳躍 | 2-3天 | ★★★☆☆ |
| 碰撞檢測系統 | 3-5天 | ★★★★☆ |
| 敵人 AI | 2-3天 | ★★★☆☆ |
| 道具系統 | 1-2天 | ★★☆☆☆ |
| 關卡設計 | 2-3天 | ★★☆☆☆ |
| UI 與計分 | 1-2天 | ★★☆☆☆ |
| 音效整合 | 1天 | ★☆☆☆☆ |
| 測試與除錯 | 2-3天 | ★★★☆☆ |

**總計：約 3-4 週全職開發**

---

## ✅ 結論

ByteTuxiaobei/Mario 是一個完成度很高的馬力歐克隆項目，但它使用的是 **C++** 而非純 C 語言。

**建議選擇：**
- 如果可以使用 C++：直接參考該專案
- 如果必須用 C：使用 **SDL2 或 Raylib** 重新開發簡化版

祝你的期末專題順利！🎮
