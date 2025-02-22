mistfly statusline
==================

_mistfly statusline_ is a simple, fast and informative `statusline` for Vim and
Neovim.

_mistfly statusline_ also provides optional `tabline` and Neovim
`winbar` support when the appropriate settings are enabled; refer to
[`mistflyTabLine`](https://github.com/bluz71/vim-mistfly-statusline#mistflywinbar)
and
[`mistflyWinBar`](https://github.com/bluz71/vim-mistfly-statusline#mistflywinbar).

_mistfly statusline_ will adapt it's colors to the colorscheme currently in
effect. Colors can also be
[customized](https://github.com/bluz71/vim-mistfly-statusline#highlight-groups-and-colors)
if desired.

Lastly, _mistfly statusline_ is a light _statusline_ plugin clocking in at
about 500 lines of code. For comparison, the
[lightline](https://github.com/itchyny/lightline.vim),
[airline](https://github.com/vim-airline/vim-airline) and
[lualine](https://github.com/nvim-lualine/lualine.nvim) `statusline` plugins
contain over 3,600, 7,900 and 7,300 lines of code respectively. In fairness, the
latter plugins are more featureful, configurable and visually pleasing.

Screenshots
-----------

![normal](https://raw.githubusercontent.com/bluz71/misc-binaries/master/mistfly/mistfly-normal.png)
![insert](https://raw.githubusercontent.com/bluz71/misc-binaries/master/mistfly/mistfly-insert.png)
![visual](https://raw.githubusercontent.com/bluz71/misc-binaries/master/mistfly/mistfly-visual.png)
![command](https://raw.githubusercontent.com/bluz71/misc-binaries/master/mistfly/mistfly-command.png)
![replace](https://raw.githubusercontent.com/bluz71/misc-binaries/master/mistfly/mistfly-replace.png)

The above screenshots are using the
[nightfly](https://github.com/bluz71/vim-nightfly-colors) colorscheme and the
[Iosevka](https://github.com/be5invis/Iosevka) font with a couple Git changes,
a single Diagnostic warning and indent-status enabled.

Statusline Performance Comparison
---------------------------------

A performance comparison of _mistfly stautusline_ against various popular
`statusline` plugins, with their out-of-the-box defaults, on a clean and minimal
Neovim setup with the [moonfly](https://github.com/bluz71/vim-moonfly-colors)
colorscheme. The Neovim startup times in the following table are provived by the
[dstein64/vim-startuptime](https://github.com/dstein64/vim-startuptime) plugin.

Startup times are the average of five consecutive runs. Note, `native` is run
without any `statusline` plugin.

| native  | mistfly | lightline | airline | lualine
|---------|---------|-----------|---------|--------
| 19.0ms  | 21.8ms  | 24.5ms    | 95.0ms  | 30.8ms

Startup times as of July 2022 on my system; performance on other systems will
vary.

Plugins, Linters and Diagnostics supported
------------------------------------------

- [vim-devicons](https://github.com/ryanoasis/vim-devicons) and
  [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) via the
  `mistflyWithNerdIcon` option

- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

- [GitGutter](https://github.com/airblade/vim-gitgutter)

- [Neovim Diagnostic](https://neovim.io/doc/user/diagnostic.html)

- [ALE](https://github.com/dense-analysis/ale)

- [Coc](https://github.com/neoclide/coc.nvim)

- [Obsession](https://github.com/tpope/vim-obsession)

:zap: Requirements
------------------

_mistfly statusline_ requires a **GUI** capable version of Vim or Neovim with an
appropriate `colorscheme` set.

A GUI client, such as Gvim, or a modern terminal version of Vim or Neovim with
`termguicolors` enabled in a true-color terminal, is required.

I encourage terminal users to use a true-color terminal, such as:
[iTerm2](https://iterm2.com),
[Alacritty](https://github.com/alacritty/alacritty)
[Windows Terminal](https://github.com/microsoft/terminal), or
[kitty](https://sw.kovidgoyal.net/kitty/index.html) and enable the
`termguicolors` option.

Installation
------------

Install **bluz71/vim-mistfly-statusline** with your preferred plugin manager.

[vim-plug](https://github.com/junegunn/vim-plug):

```viml
Plug 'bluz71/vim-mistfly-statusline'
```

[packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use 'bluz71/vim-mistfly-statusline'
```

Legacy Installation
-------------------

_mistfly statusline_ still supports the legacy version of this plugin,
previously named _moonfly statusline_, via the `moonfly-compat` branch. That
legacy version can be installed with your preferred plugin manager.

[vim-plug](https://github.com/junegunn/vim-plug):

```viml
Plug 'bluz71/vim-mistfly-statusline', { 'branch': 'moonfly-compat' }
```

[packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use { 'bluz71/vim-mistfly-statusline', branch = 'moonfly-compat' }
```

Notice
------

File explorers, such as _NERDTree_ and _netrw_, and certain other special
buffers will be minimally styled by this plugin, which often is for the best for
these special buffer.

Layout And Default Colors
-------------------------

The *mistfly-statusline* layout consists of two main groupings, the left-side
and right-side groups as follows:

```
+-------------------------------------------------+
| A | B | C | D                         X | Y | Z |
+-------------------------------------------------+
```

| Section | Purpose
|---------|------------------
| A`*`    | Mode status (normal, insert, visual, command and replace modes)
| B       | Compacted filename (see below for details)
| C`*`    | Git repository branch name (if applicable)
| D`*`    | Plugins notification (git, diagnostic and session status)
| X       | Current position
| Y`*`    | Total lines and current location as percentage
| Z       | Optional indent status (spaces and tabs shift width)

Sections marked with a `*` are linked to a highlight group and are colored,
refer to the next section for details.

Note, filenames will be compacted as follows:

- Pathless filenames only for files in the current working directory

- Relative paths in preference to absolute paths for files not in the current
  working directory

- `~`-style home directory paths in preference to absolute paths

- Truncated, for example `foo/bar/bazz/hello.txt` will be displayed as
  `f/b/b/hello.txt`

- Trimmed, a maximum of four path components will be displayed for a filename,
  if a filename is more deeply nested then only the four most significant
  components, including the filename, will be displayed with an ellipses `...`
  prefix used to indicate path trimming.

Highlight Groups And Colors
---------------------------

Sections marked with `*` in the previous section are linked to the following
custom highlight groups with their associated fallbacks if the current
colorscheme does not support _mistfly statusline_.

| Segment                  | Custom Highlight Group | Synthesized Highlight Fallback
|--------------------------|------------------------|-------------------------------
| Normal Mode              | `MistflyNormal`        | `Directory`
| Insert Mode              | `MistflyInsert`        | `String`
| Visual Mode              | `MistflyVisual`        | `Statement`
| Command Mode             | `MistflyCommand`       | `WarningMsg`
| Replace Mode             | `MistflyReplace`       | `Error`

Note, the following colorschemes support _mistfly statusline_, either within the
colorscheme (moonfly & nightfly) or within this plugin (all others):

- [moonfly](https://github.com/bluz71/vim-moonfly-colors)

- [nightfly](https://github.com/bluz71/vim-nightfly-guicolors)

- [catppuccin](https://github.com/catppuccin/nvim)

- [dracula](https://github.com/dracula/vim)

- [edge](https://github.com/sainnhe/edge)

- [embark](https://github.com/embark-theme/vim)

- [everforest](https://github.com/sainnhe/everforest)

- [gruvbox](https://github.com/gruvbox-community/gruvbox)

- [gruvbox-material](https://github.com/sainnhe/gruvbox-material)

- [nightfox](https://github.com/EdenEast/nightfox.nvim)

- [sonokai](https://github.com/sainnhe/sonokai)

- [tokyonight](https://github.com/folke/tokyonight.nvim)

Lastly, if the fallback colors do not suit then it is very easy to override with
your own highlights.

:gift: Here is a simple example of customized _mistfly statusline_ colors. Save
the following either at the end of your initialization file, after setting your
`colorscheme`, or in an appropriate `after` file such as
`after/plugin/mistfly-statusline.vim`.

```viml
highlight! link MistflyNormal DiffChange
highlight! link MistflyInsert WildMenu
highlight! link MistflyVisual IncSearch
highlight! link MistflyCommand WildMenu
highlight! link MistflyReplace ErrorMsg
```

:wrench: Options
----------------

| Option | Default State
|--------|--------------
| [mistflyAsciiShapes](https://github.com/bluz71/vim-mistfly-statusline#mistflyasciishapes)                           | Disabled, do display Unicode shapes
| [mistflyErrorSymbol](https://github.com/bluz71/vim-mistfly-statusline#mistflyerrorsymbol)                           | `x`
| [mistflyWarningSymbol](https://github.com/bluz71/vim-mistfly-statusline#mistflywarningsymbol)                       | `!`
| [mistflyTabLine](https://github.com/bluz71/vim-mistfly-statusline#mistflytabline)                                   | Disabled
| [mistflyWinBar](https://github.com/bluz71/vim-mistfly-statusline#mistflywinbar)                                     | Disabled
| [mistflyWithIndentStatus](https://github.com/bluz71/vim-mistfly-statusline#mistflywithindentstatus)                 | Disabled
| [mistflyWithGitBranch](https://github.com/bluz71/vim-mistfly-statusline#mistflywithgitbranch)                       | Enabled
| [mistflyWithGitsignsStatus](https://github.com/bluz71/vim-mistfly-statusline#mistflywithgitsignsstatus)             | Enabled if Gitsigns plugin is loaded
| [mistflyWithGitGutterStatus](https://github.com/bluz71/vim-mistfly-statusline#mistflywithgitgutterstatus)           | Enabled if GitGutter plugin is loaded
| [mistflyWithNvimDiagnosticStatus](https://github.com/bluz71/vim-mistfly-statusline#mistflywithnvimdiagnosticstatus) | Enabled if nvim-lspconfig plugin is loaded
| [mistflyWithALEStatus](https://github.com/bluz71/vim-mistfly-statusline#mistflywithalestatus)                       | Enabled if ALE plugin is loaded
| [mistflyWithCocStatus](https://github.com/bluz71/vim-mistfly-statusline#mistflywithcocstatus)                       | Enabled if Coc plugin is loaded

---

### mistflyAsciiShapes

The `mistflyAsciiShapes` option specifies whether to only use Ascii characters
for certain dividers and symbols.

_mistfly statusline_ by default **will use** Unicode Symbols and Powerline
Glyphs for certain shapes such as: Git branch, dividers and active tabs. Note,
many modern fonts, such as: [Hack](https://sourcefoundry.org/hack),
[Iosevka](https://typeof.net/Iosevk), [Fira
Code](https://github.com/tonsky/FiraCode) and [Jetbrains
Mono](https://www.jetbrains.com/lp/mono), will provide these shapes.

To limit use only to Ascii shapes please add the following to your
initialization file:

```viml
" Vimscript initialization file
let g:mistflyAsciiShapes = v:true
```

```lua
-- Lua initialization file
vim.g.mistflyAsciiShapes = true
```

---

### mistflyErrorSymbol

The `mistflyErrorSymbol` option specifies which character symbol to use when
displaying [Neovim Diagnostic](https://neovim.io/doc/user/diagnostic.html),
[ALE](https://github.com/dense-analysis/ale) or
[Coc](https://github.com/neoclide/coc.nvim) errors.

By default, the `x` character, will be displayed.

To specify your own error symbol please add the following to your initialization
file:

```viml
" Vimscript initialization file
let g:mistflyErrorSymbol = '<<SYMBOL-OF-YOUR-CHOOSING>>'
```

```lua
-- Lua initialization file
vim.g.mistflyErrorSymbol = '<<SYMBOL-OF-YOUR-CHOOSING>>'
```

---

### mistflyWarningSymbol

The `mistflyWarningSymbol` option specifies which character symbol to use when
displaying [Neovim Diagnostic](https://neovim.io/doc/user/diagnostic.html),
[ALE](https://github.com/dense-analysis/ale) or
[Coc](https://github.com/neoclide/coc.nvim) warnings.

By default, the exclamation symbol, `!`, will be displayed.

To specify your own warning symbol please add the following to your
initialization file:

```viml
" Vimscript initialization file
let g:mistflyWarningSymbol = '<<SYMBOL-OF-YOUR-CHOOSING>>'
```

```lua
-- Lua initialization file
vim.g.mistflyWarningSymbol = '<<SYMBOL-OF-YOUR-CHOOSING>>'
```

---

### mistflyTabLine

The `mistflyTabLine` option specifies whether to let this plugin manage the
`tabline` in addition to the `statusline`. By default `tabline` management will
not be undertaken.

If enabled, _mistfly statusline_ will render a simple numbered, and clickable,
window-space layout in the `tabline`; note, no buffers will be displayed in the
`tabline` since there are many plugins that already provide that capability.

To enable _mistfly statusline_'s `tabline` support please add the following to
your initialization file:

```viml
" Vimscript initialization file
let g:mistflyTabLine = v:true
```

```lua
-- Lua initialization file
vim.g.mistflyTabLine = true
```

:bulb: Mappings, such as the following, may be useful to quickly switch between
the numbered window-spaces:

```viml
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
```

A screenshot of the `tabline`:

![tabline](https://raw.githubusercontent.com/bluz71/misc-binaries/master/mistfly/mistfly-tabline.png)

---

### mistflyWinBar

The `mistflyWinBar` option specifies whether to display Neovim's window bar at
the top of each window. By default window bars will not be displayed.

Note, Neovim 0.8 (or later) is required for this feature.

Displaying a window bar is reasonable when Neovim's global statusline is enabled
via `set laststatus=3`; the `winbar` will then display the file name at the top
of each window to disambiguate splits. Also, if there only one window in the
current tab then a `winbar` will not be displayed (it won't be needed).

To enable Neovim's `winbar` feature please add the following to your
initialization file:

```viml
" Vimscript initialization file
let g:mistflyWinBar = v:true
```

```lua
-- Lua initialization file
vim.g.mistflyWinBar = true
```

---

### mistflyWithIndentStatus

The `mistflyWithIndentStatus` option specifies whether to display the
indentation status as the last component in the statusline. By default
indentation status will not be displayed.

Note, if the `expandtab` option is set, for the current buffer, then tab stop
will be displayed, for example `Tab:4` (tab equals four spaces); if on the other
hand `noexpandtab` option is set then shift width will be displayed instead, for
example `Spc:2` ('spc' short for 'space').

To enable indentation status please add the following to your initialization
file:

```viml
" Vimscript initialization file
let g:mistflyWithIndentStatus = v:true
```

```lua
-- Lua initialization file
vim.g.mistflyWithIndentStatus = true
```

---

### mistflyWithGitBranch

The `mistflyWithGitBranch` option specifies whether to display Git branch
details in the _statusline_. By default Git branches will be displayed in the
`statusline`.

To disable the display of Git branches in the _statusline_ please add the
following to your initialization file:

```viml
" Vimscript initialization file
let g:mistflyWithGitBranch = v:false
```

```lua
-- Lua initialization file
vim.g.mistflyWithGitBranch = false
```

---

### mistflyWithGitsignsStatus

The `mistflyWithGitsignsStatus` option specifies whether to display
[Gitsigns](https://github.com/lewis6991/gitsigns.nvim) of the current buffer in
the _statusline_.

By default, Gitsigns will be displayed if the plugin is loaded.

To disable the display of Gitsigns in the _statusline_ please add the following
to your initialization file:

```viml
" Vimscript initialization file
let g:mistflyWithGitsignsStatus = v:false
```

```lua
-- Lua initialization file
vim.g.mistflyWithGitsignsStatus = false
```

---

### mistflyWithGitGutterStatus

The `mistflyWithGitGutterStatus` option specifies whether to display
[GitGutter](https://github.com/airblade/vim-gitgutter) status of the current
buffer in the _statusline_.

By default, GitGutter status will be displayed if the plugin is loaded.

To disable the display of GitGutter status in the _statusline_ please add the
following to your initialization file:

```viml
" Vimscript initialization file
let g:mistflyWithGitGutterStatus = v:false
```

```lua
-- Lua initialization file
vim.g.mistflyWithGitGutterStatus = false
```

---

### mistflyWithNerdIcon

The `mistflyWithNerdIcon` option specifies whether a filetype icon, from the
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
let g:mistflyWithNerdIcon = v:true
```

```lua
-- lua initialization file
vim.g.mistflyWithNerdIcon = true
```

---

### mistflyWithNvimDiagnosticStatus

_mistfly statusline_ supports [Neovim
Diagnostics](https://neovim.io/doc/user/diagnostic.html)

The `mistflyWithNvimDiagnosticStatus` option specifies whether to indicate the
presence of the Neovim Diagnostics in the current buffer.

By default, Neovim Diagnositics will be displayed if the
[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) plugin is loaded.

If Neovim Diagnostic display is not wanted then please add the following to
your initialization file:

```viml
" Vimscript initialization file
let g:mistflyWithNvimDiagnosticStatus = v:false
```

```lua
-- Lua initialization file
vim.g.mistflyWithNvimDiagnosticStatus = false
```

---

### mistflyWithALEStatus

_mistfly statusline_ supports the [ALE](https://github.com/dense-analysis/ale)
plugin.

The `mistflyWithALEStatus` option specifies whether to indicate the presence of
the ALE errors and warnings in the current buffer.

By default, ALE errors and warnings will be displayed if the plugin is loaded.

If ALE error and warning display are not wanted then please add the following to
your initialization file:

```viml
" Vimscript initialization file
let g:mistflyWithALEStatus = v:false
```

```lua
-- Lua initialization file
vim.g.mistflyWithALEStatus = false
```

---

### mistflyWithCocStatus

_mistfly statusline_ supports the [Coc](https://github.com/neoclide/coc.nvim)
plugin.

The `mistflyWithCocStatus` option specifies whether to indicate the presence of
the Coc diagnostics in the current buffer.

By default, Coc diagnostics will be displayed if the plugin is loaded.

If Coc diagnostics are not wanted then please add the following to your
initialization file:

```viml
" Vimscript initialization file
let g:mistflyWithCocStatus = v:false
```

```lua
-- Lua initialization file
vim.g.mistflyWithCocStatus = false
```

Sponsor
-------

[![Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/bluz71)

License
-------

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
