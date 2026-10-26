# kickstart.nvim (Neovim 0.12)

This branch is the **Neovim 0.12+** version of this config. `master` keeps the
older, pre-0.12 version.

Requires **Neovim >= 0.12.0** (`:checkhealth kickstart.nvim` will tell you if
your Neovim is too old).

### What changed for 0.12

- **LSP** — servers are registered with `vim.lsp.config()` and started with
  `vim.lsp.enable()` (see `lua/plugins/lsp.lua`). The legacy
  `require('lspconfig')[name].setup()` framework is deprecated and is being
  removed from `nvim-lspconfig`; `nvim-lspconfig` is still installed because it
  now only ships the per-server defaults that `vim.lsp.config()` picks up from
  its `lsp/` directory. `mason-lspconfig` 2.x no longer has a `handlers` table —
  servers installed through Mason are enabled with `automatic_enable`
  (`vim.lsp.enable()`).
- **Capabilities** — the `nvim-cmp` capabilities are declared once for every
  server with the special `vim.lsp.config('*', { ... })` config.
- **Diagnostics** — the sign column glyphs are configured with
  `vim.diagnostic.config { signs = { ... } }`. Setting `DiagnosticSign*`
  highlights with `vim.fn.sign_define()` no longer has any effect in 0.12.
- **Tree-sitter** — `nvim-treesitter` is on its `main` branch (`master` is
  frozen for 0.11). `nvim-treesitter.configs`, `:TSEnable` and the
  `highlight`/`indent` options are gone: parsers are installed with
  `require('nvim-treesitter').install()` and highlighting/indentation are
  switched on per buffer with `vim.treesitter.start()` from a `FileType`
  autocommand, see `lua/plugins/treesitter.lua`.
- `vim.highlight.on_yank()` → `vim.hl.on_yank()`.
- `client.supports_method()` → `client:supports_method()`.
- `gitsigns.toggle_deleted()` → `gitsigns.preview_hunk_inline()`.
- `unpack()` → `vim.list_extend()` in the DAP keymaps.
- Dropped the archived `kyazdani42/nvim-web-devicons` duplicate spec, and
  `telescope.nvim` no longer pins the frozen `0.1.x` branch.

### Upgrading from the previous config

Run `:Lazy update` after the first start, so `nvim-treesitter` moves to the
`main` branch and `telescope.nvim` leaves `0.1.x` (their pins were dropped from
`lazy-lock.json`). `:TSUpdate` is wired up as a build step, so parsers follow
along on the next update.

### Known leftovers

- `lua/plugins/feline.lua` is not loaded anywhere (it is not in the lazy.nvim
  spec), and feline.nvim itself is unmaintained; kept as-is.
- `barbecue.nvim` is archived and still works, but it calls the long-deprecated
  `nvim_get_hl_by_name()`, so expect a deprecation warning — `:checkhealth
  vim.deprecated` lists it. Swap it for `nvim-navic` + a `winbar` (or
  `Bekaboo/dropbar.nvim`) if the warning bothers you.
- `nvim-cmp` still works on 0.12; Neovim's built-in completion
  (`vim.lsp.completion` / the new `'autocomplete'` option) is an alternative but
  was not adopted here.

### Install External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, `curl`, `tar`, C Compiler (`gcc`)
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md)
  >= 0.26.1, from your package manager (not npm) — needed by `nvim-treesitter`'s
  `main` branch to build parsers
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

> **NOTE**
> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes
> and quick install snippets

#### Why is the kickstart `init.lua` a single file? Wouldn't it make sense to split it into multiple files?
  * The main purpose of kickstart is to serve as a teaching tool and a reference
    configuration that someone can easily use to `git clone` as a basis for their own.
    As you progress in learning Neovim and Lua, you might consider splitting `init.lua`
    into smaller parts. A fork of kickstart that does this while maintaining the 
    same functionality is available here:
    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
  * Discussions on this topic can be found here:
    * [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    * [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)

### Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

After installing all the dependencies continue with the [Install Kickstart](#Install-Kickstart) step.

#### Windows Installation

<details><summary>Windows with Microsoft C++ Build Tools and CMake</summary>
Installation may require installing build tools and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```
</details>
<details><summary>Windows with gcc/make using chocolatey</summary>
Alternatively, one can install gcc and make which don't require changing the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
either follow the instructions on the page or use winget,
run in cmd as **admin**:
```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
open a new one so that choco path is set, and run in cmd as **admin**:
```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```
</details>
<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>

#### Linux Install
<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>
<details><summary>Debian Install Steps</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```
</details>
<details><summary>Fedora Install Steps</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```
</details>

<details><summary>Arch Install Steps</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```
</details>

