# Isaac Decrafting Tool · 以撒合成宝袋挖掘器

基于 [frto027/IsaacDecraftingHuijiGadget](https://github.com/frto027/IsaacDecraftingHuijiGadget) 二次开发的独立部署版本。

> 原项目是为灰机 wiki 设计的 Vue 3 Gadget 内嵌工具。  
> 本项目将其改造为可独立部署的 Web 应用，并增加了大量 UI/UX 改进。

## 功能

- 🔢 **种子计算**：输入以撒种子码（如 `JKD9 Z0C9`），穷举所有 8 格合成配方
- 🧩 **材料管理**：30 种基础材料（红心 / 魂心 / 硬币 / 钥匙 / 炸弹…），拖拽排序，下拉计数
- 📊 **品质档位**：实时显示配方总分范围及对应的道具品质档位
- 🏷️ **品质分组**：合成结果按道具品质（0~4）自动分组显示
- 📋 **固定配方表**：19 条与种子无关的固定配方，卡片式展示
- ⚡ **WASM 加速**：可选开启 WebAssembly 加速（~100x 性能提升），不支持时自动降级
- 🎮 **游戏选项**：贪婪模式 / 每日挑战 / 第四章后 / 各角色过滤器

## 快速开始

**前提：** 需要安装 [Node.js](https://nodejs.org/)（v16 或更高版本）。

### Windows

双击 `start.bat`，自动完成依赖安装并启动。浏览器会自动打开 `http://localhost:8080/`。

### macOS / Linux

```bash
npm install
npm run serve
```

然后浏览器访问 `http://localhost:8080/`。

### 生产部署

```bash
npm install
npm run build
```

构建产物在 `dist/` 目录，部署到任意静态服务器即可。

## 技术栈

| 层 | 技术 |
|----|------|
| 前端框架 | Vue 3 (Options API) |
| UI 框架 | Bootstrap 5.1 |
| 构建工具 | Vue CLI 4.5 |
| 高性能计算 | C++ → WebAssembly (Emscripten) |
| 并行计算 | Web Worker（内联） |
| 游戏数据 | 以撒 XML 解包 → Python 脚本生成 |
| 兼容性 | Babel + es3ify-mw（支持 IE8 / MediaWiki） |

## 改动说明

相对于原项目的主要改进：

- **独立部署**：不再依赖灰机 wiki 的 CSS 和 JS 环境
- **Bootstrap 5 适配**：修复了所有已废弃的类名（`btn-xs`、`btn-default`、`col-xs-*` 等）
- **深色主题**：完整深色背景，所有元素清晰可见
- **品质分组**：合成结果按道具品质（0~4）分组，每组标明道具数量
- **材料分值**：每个材料卡片显示品质分值，方便评估配方
- **分值档位表**：实时显示当前配方总分范围及品质档位对照表
- **固定配方卡**：19 条固定配方卡片化展示，包含配方材料图标，按 ID 排序
- **UI 优化**：自适应宽度、合理页边距、材料按分值排序
- **Wiki 链接**：道具图标点击新标签页跳转灰机 wiki
- **一键启动**：`start.bat` 自动检测 Node.js、自动安装依赖

## 数据来源

| 数据 | 来源 |
|------|------|
| 道具品质 | [灰机 wiki 品质页面](https://isaac.huijiwiki.com/wiki/品质) |
| 道具池 & 标签 | 游戏 `items.xml` / `items_metadata.xml` / `itempools.xml` 解包 |
| 道具精灵图 | 灰机 wiki CDN (`huiji-public.huijistatic.com`) |
| 材料精灵图 | 灰机 wiki CDN |

## 致谢

- **[frto027](https://github.com/frto027)** — 原作者，创造了合成宝袋挖掘器的核心算法、WASM 加速和 wiki 版本
- **[灰机 wiki 以撒社区](https://isaac.huijiwiki.com/)** — 道具数据与精灵图资源
