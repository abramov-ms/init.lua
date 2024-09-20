# Базированный конфиг для C/C++

## clangd

Подсветка и go to definition работают за счет
[`clangd`](https://clangd.llvm.org/). Его можно поставить через пакетный
менеджер либо из вима через mason (`<space>mm`, потом найти clangd и тыкнуть
`I` по нему).

В проектах с нестандартными флагами компиляции нужно, чтобы в корневой
директрии был файл
[`compile_commands.json`](https://clang.llvm.org/docs/JSONCompilationDatabase.html).
Через симейк можно его получить, если проставить
[`CMAKE_EXPORT_COMPILE_COMMANDS`](https://cmake.org/cmake/help/latest/variable/CMAKE_EXPORT_COMPILE_COMMANDS.html)
(`mkdir build && cd build && cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=ON`).
Если проект не на симейке, можно использовать
[`bear`](https://github.com/rizsotto/Bear).

## Хоткеи

| Клавиши в normal mode | Действие |
| --- | --- |
| `<Space>mm` | Открыть [mason](https://github.com/williamboman/mason.nvim) |
| `<Space>ll` | Открыть [lazy](https://github.com/folke/lazy.nvim) |
| `-` | Открыть [oil](https://github.com/stevearc/oil.nvim) / `cd ..` |
| `<Alt>O` | Переключение между хедером и `.cpp` |
| `<Space>np` | Переключение [no-neck-pain](https://github.com/shortcuts/no-neck-pain.nvim) |
| `<Space>ff` | Поиск файлов через [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| `<Space>fs` | Греп по файлам требует установки [ripgrep](https://github.com/BurntSushi/ripgrep) |
| `<Space>ldf` | Поиск символов в текущем буфере |
| `<Space>lfs` | Поиск символов глобально в проекте |
| `<Space>lfr` | Find references на символ под курсором |
| `<Space>lcw` | Переименовать символ под курсором |
| `<Space>gs` | Открыть [neogit](https://github.com/NeogitOrg/neogit) |

Остальные хоткеи по большей части в [keymaps.lua](lua/config/keymaps.lua).

## Как поменять caps lock и escape

```bash
setxkbmap -option caps:swapescape
```

Будет гораздо удобнее переходить в normal mode.

***

Heavily inspired by [ThePrimeagen/init.lua](https://github.com/ThePrimeagen/init.lua).
