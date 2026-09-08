# Базированный конфиг для C/C++

## clangd

Подсветка и go to definition работают за счет
[Clangd](https://clangd.llvm.org/). Его можно поставить через пакетный
менеджер либо из Mason (`<space>mm`, потом найти Clangd и тыкнуть
`I` по нему).

В проектах с нестандартными флагами компиляции нужно, чтобы в корневой
директории был файл
[`compile_commands.json`](https://clang.llvm.org/docs/JSONCompilationDatabase.html).

Через CMake можно его получить, если проставить
[`CMAKE_EXPORT_COMPILE_COMMANDS`](https://cmake.org/cmake/help/latest/variable/CMAKE_EXPORT_COMPILE_COMMANDS.html)
(`mkdir build && cd build && cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=ON`).

Если проект не на CMake, можно использовать
[Bear](https://github.com/rizsotto/Bear).

## Хоткеи

| Клавиши в normal mode | Действие |
| --- | --- |
| `<Space>mm` | Открыть [Mason](https://github.com/williamboman/mason.nvim) |
| `<Space>ll` | Открыть [Lazy](https://github.com/folke/lazy.nvim) |
| `-` | Открыть [Oil](https://github.com/stevearc/oil.nvim) / `cd ..` |
| `<Alt>o` | Переключение между хедером и `.cpp` |
| `<Space>ff` | Поиск файлов через [Telescope](https://github.com/nvim-telescope/telescope.nvim) |
| `<Space>fs` | Grep по файлам, требует установки [ripgrep](https://github.com/BurntSushi/ripgrep) |
| `<Space>ldf` | Поиск символов в текущем буфере |
| `<Space>lfs` | Поиск символов глобально в проекте |
| `<Space>lfr` | Find references на символ под курсором |
| `<Space>lcw` | Переименовать символ под курсором |

Остальные хоткеи по большей части в [keymaps.lua](lua/config/keymaps.lua).

## Как поменять caps lock и escape

```bash
setxkbmap -option caps:swapescape
```

Будет гораздо удобнее переходить в normal mode.

***

Heavily inspired by [ThePrimeagen/init.lua](https://github.com/ThePrimeagen/init.lua).
