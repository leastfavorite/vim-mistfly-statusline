moonfly statusline
==================

_moonfly statusline_ is a simple, yet informative, _statusline_ for Vim and
Neovim that uses [moonfly](https://github.com/bluz71/vim-moonfly-colors) colors
by default. Note, the _statusline_ colors can easily be
[customized](https://github.com/bluz71/vim-moonfly-statusline#moonflyignoredefaultcolors)
if desired.

_moonfly statusline_ is a very light _statusline_ plugin clocking in at
around 200 lines of Vimscript. For comparison, the
[lightline](https://github.com/itchyny/lightline.vim) and
[airline](https://github.com/vim-airline/vim-airline) _statusline_ plugins
contain over 3,500 and 6,500 lines of Vimscript respectively. In fairness, the
latter two plugins are also more featureful.

Lastly, for those that configure their own _statusline_ but seek only to add
some niceties, such a colorful mode indicator for example, then feel free to
browse the
[source](https://github.com/bluz71/vim-moonfly-statusline/blob/master/plugin/moonfly-statusline.vim)
and borrow freely.

Screenshots
-----------

<img width="900" alt="normal" src="https://raw.githubusercontent.com/bluz71/misc-binaries/master/moonfly/moonfly_normal.png">

<img width="900" alt="insert" src="https://raw.githubusercontent.com/bluz71/misc-binaries/master/moonfly/moonfly_insert.png">

<img width="900" alt="visual" src="https://raw.githubusercontent.com/bluz71/misc-binaries/master/moonfly/moonfly_visual.png">

<img width="900" alt="visual" src="https://raw.githubusercontent.com/bluz71/misc-binaries/master/moonfly/moonfly_replace.png">

The font in use is [Iosevka](https://github.com/be5invis/Iosevka). Also, the
`g:moonflyWithGitBranchCharacter` option is set to `1`.

Plugins, Linters and Diagnostics supported
------------------------------------------

- [vim-devicons](https://github.com/ryanoasis/vim-devicons) and
  [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) via the
  `moonflyWithNerdIcon` option

- [Neovim Diagnostic](https://neovim.io/doc/user/diagnostic.html) via the
  `moonflyWithNvimDiagnosticIndicator` option

- [ALE](https://github.com/dense-analysis/ale) via the
  `moonflyWithALEIndicator` option

- [Coc](https://github.com/neoclide/coc.nvim) via the
  `moonflyWithCocIndicator` option

- [Obsession](https://github.com/tpope/vim-obsession)

Installation
------------

Install **bluz71/vim-moonfly-statusline** with your preferred plugin manager.

[vim-plug](https://github.com/junegunn/vim-plug):

```viml
Plug 'bluz71/vim-moonfly-statusline'
```

[packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use 'bluz71/vim-moonfly-statusline'
```

Notice
------

File explorers, such as _NERDTree_ and _netrw_, and certain other special
windows will **not** be directly styled by this plugin.

Layout And Default Colors
-------------------------

The *moonfly-statusline* layout contains two groupings, the left side segments:

```
<Mode *> <Filename & Flags> <Git Branch *> <Plugins Status *>
```

And the right side segments:

```
<Line:Column> | <Total Lines *> | <% Position>
```

Segments marked with a `*` will be colored by default, refer to the table below.

Note also, filenames will be displayed as follows:

- Pathless filenames only for files in the current working directory

- Relative paths in preference to absolute paths for files not in the current
  working directory

- `~`-style home directory paths in preference to absolute paths

- Compacted, for example `foo/bar/bazz/hello.txt` will be displayed as
  `f/b/b/hello.txt`

- Trimmed, a maximum of four path components will be displayed for a filename,
  if a filename is more deeply nested then only the four most significant
  components, including the filename, will be displayed with an ellipses `...`
  prefix used to indicate path trimming.

The default [moonfly](https://github.com/bluz71/vim-moonfly-colors) colours used
for the above listed colored `*` segments:

| Segment           | Highlight Group | Background                                                  | Foreground                                                  |
|-------------------|-----------------|-------------------------------------------------------------|-------------------------------------------------------------|
| Normal Mode       | `User1`         | ![background](https://via.placeholder.com/32/80a0ff?text=+) | ![background](https://via.placeholder.com/32/1c1c1c?text=+) |
| Insert Mode       | `User2`         | ![background](https://via.placeholder.com/32/c6c6c6?text=+) | ![background](https://via.placeholder.com/32/1c1c1c?text=+) |
| Visual Mode       | `User3`         | ![background](https://via.placeholder.com/32/ae81ff?text=+) | ![background](https://via.placeholder.com/32/1c1c1c?text=+) |
| Replace Mode      | `User4`         | ![background](https://via.placeholder.com/32/f74782?text=+) | ![background](https://via.placeholder.com/32/1c1c1c?text=+) |
| Git Branch        | `User5`         | `StatusLine` background                                     | ![background](https://via.placeholder.com/32/80a0ff?text=+) |
| Plugins Status    | `User6`         | `StatusLine` background                                     | ![background](https://via.placeholder.com/32/f74782?text=+) |
| Total Lines       | `User7`         | `StatusLine` background                                     | ![background](https://via.placeholder.com/32/80a0ff?text=+) |

:wrench: Options
----------------

### moonflyIgnoreDefaultColors

The `moonflyIgnoreDefaultColors` option specifies whether custom _statusline_
colors should be used in-place of
[moonfly](https://github.com/bluz71/vim-moonfly-colors) colors. By default
[moonfly](https://github.com/bluz71/vim-moonfly-colors) colors will be
displayed. If custom colors are to be used then please add the following to your
initialization file

```viml
" Vimscript initialization file
let g:moonflyIgnoreDefaultColors = 1
```

```lua
-- Lua initialization file
vim.g.moonflyIgnoreDefaultColors = 1
```

:gift: Here is an example of a customized _statusline_ color theme which should
work well with most existing Vim colorschemes. Save the following either
at the end of your initialization file or in an appropriate `after` file such as
`~/.vim/after/plugin/moonfly-statusline.vim`:

```viml
highlight! link User1 DiffText
highlight! link User2 DiffAdd
highlight! link User3 Search
highlight! link User4 IncSearch
highlight! link User5 StatusLine
highlight! link User6 StatusLine
highlight! link User7 StatusLine
```

:cake: Note, the [nightfly](https://github.com/bluz71/vim-nightfly-guicolors)
color scheme automatically defines _statusline_ colors that are compatible with
this plugin. **No** custom settings are required with that colorscheme.

---

### moonflyWithGitBranch

The `moonflyWithGitBranch` option specifies whether to display Git branch
details in the _statusline_. By default Git branches will be displayed in the
`statusline`.

To disable the display of Git branches in the _statusline_ please add the
following to your initialization file:

```viml
" Vimscript initialization file
let g:moonflyWithGitBranch = 0
```

```lua
-- Lua initialization file
vim.g.moonflyWithGitBranch = 0
```

---

### moonflyWithGitBranchCharacter

The `moonflyWithGitBranchCharacter` option specifies whether to display Git
branch details with the Unicode Git branch character `U+E0A0`. By default Git
branches displayed in the `statusline` will not use that character since many
monospace fonts will not contain it. However, some modern fonts, such as [Fira
Code](https://github.com/tonsky/FiraCode) and
[Iosevka](https://github.com/be5invis/Iosevka), do contain that Git branch
character.

If `moonflyWithGitBranchCharacter` is unset or set to zero then the current
Git branch will be displayed inside square brackets.

To display with the Unicode Git branch character please add the following to
your initialization file:

```viml
" Vimscript initialization file
let g:moonflyWithGitBranchCharacter = 1
```

```Lua
-- Lua initialization file
vim.g.moonflyWithGitBranchCharacter = 1
```

The above screenshots are displayed with the Git branch character.

---

### moonflyWithNerdIcon

The `moonflyWithNerdIcon` option specifies whether a filetype icon, from the
current Nerd Font, will be displayed next to the filename in the `statusline`.

Note, a [Nerd Font](https://www.nerdfonts.com) must be in-use **and** the
[vim-devicons](https://github.com/ryanoasis/vim-devicons) or
[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) plugin must
be installed and active.

By default a Nerd Font filetype icon will not be displayed in the
`statusline`.

To display a Nerd Font filetype icon please add the following to your
initialization file:

```viml
" Vimscript initialization file
let g:moonflyWithNerdIcon = 1
```

```lua
-- lua initialization file
vim.g.moonflyWithNerdIcon = 1
```

---

### moonflyDiagnosticSymbol

The `moonflyDiagnosticSymbol` option specifies which character symbol to use to
indicate diagnostic errors. Currently,
[Neovim](https://neovim.io/doc/user/diagnostic.html),
[ALE](https://github.com/dense-analysis/ale) and
[Coc](https://github.com/neoclide/coc.nvim) diagnostics may be indicated with
this symbol (when the appropriate diagnostic option is set, see below).

By default, the Unicode cross character (`U+2716`), `✖`, will be displayed. A
modern font, such as [Iosevka](https://github.com/be5invis/Iosevka), will
contain that Unicode character.

To specify your own diagnostics symbol please add the following to your
initialization file:

```viml
" Vimscript initialization file
let g:moonflyDiagnosticSymbol = '<<SYMBOL-OF-YOUR-CHOOSING>>'
```

```lua
-- Lua initialization file
vim.g.moonflyDiagnosticSymbol = '<<SYMBOL-OF-YOUR-CHOOSING>>'
```

---

### moonflyWithNvimDiagnosticIndicator

_moonfly statusline_ supports [Neovim
Diagnostics](https://neovim.io/doc/user/diagnostic.html)

The `moonflyWithNvimDiagnosticIndicator` option specifies whether to indicate
the presence of the Neovim Diagnostics in the current buffer via the defined
`moonflyDiagnosticSymbol` (the Unicode `U+2716` `✖` symbol by default). If
enabled, the indicator will be displayed in the left-side section of the
_statusline_.

By default, Neovim Diagnositics will **not** be indicated.

If Neovim Diagnostic indication is desired then please add the following to
your initialization file:

```viml
" Vimscript initialization file
let g:moonflyWithNvimDiagnosticIndicator = 1
```

```lua
-- Lua initialization file
vim.g.moonflyWithNvimDiagnosticIndicator = 1
```

---

### moonflyWithALEIndicator

_moonfly statusline_ supports the [ALE](https://github.com/dense-analysis/ale)
plugin.

The `moonflyWithALEIndicator` option specifies whether to indicate the
presence of the ALE errors and warnings in the current buffer via the defined
`moonflyDiagnosticSymbol` (the Unicode `U+2716` `✖` symbol by default). If
enabled, the indicator will be displayed in the left-side section of the
_statusline_.

By default, ALE errors and warnings will **not** be indicated.

If ALE indication is desired then please add the following to your
initialization file:

```viml
" Vimscript initialization file
let g:moonflyWithALEIndicator = 1
```

```lua
-- Lua initialization file
vim.g.moonflyWithALEIndicator = 1
```

---

### moonflyWithCocIndicator

_moonfly statusline_ supports the [Coc](https://github.com/neoclide/coc.nvim)
plugin.

The `moonflyWithCocIndicator` option specifies whether to indicate the
presence of the Coc diagnostics in the current buffer via the defined
`moonflyDiagnosticSymbol` (the Unicode `U+2716` `✖` symbol by default). If
enabled, the indicator will be displayed in the left-side section of the
_statusline_.

By default, Coc errors will **not** be indicated.

If Coc error indication is desired then please add the following to your
initialization file:

```viml
" Vimscript initialization file
let g:moonflyWithCocIndicator = 1
```

```lua
-- Lua initialization file
vim.g.moonflyWithCocIndicator = 1
```

---

### moonflyWithObessionGeometricCharacters

_moonfly statusline_ supports Tim Pope's
[Obsession](https://github.com/tpope/vim-obsession) plugin.

The `moonflyWithObessionGeometricCharacters` option specifies whether to
display obsession details using Unicode geometric characters (`U+25A0` - Black
Square & `U+25CF` - Black Circle). A modern font, such as
[Iosevka](https://github.com/be5invis/Iosevka), will contain those Unicode
geometric characters.

If `moonflyWithObessionGeometricCharacters` is unset the default value from
the Obsession plugin will be used.

To display Obsession status with geometric characters please add the following
to your initialization file:

```viml
" Vimscript initialization file
let g:moonflyWithObessionGeometricCharacters = 1
```

```lua
-- Lua initialization file
vim.g.moonflyWithObessionGeometricCharacters = 1
```

Sponsor
-------

[![Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/bluz71)

License
-------

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
