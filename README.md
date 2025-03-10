# Backup copy of my Neovim configuration

This is a backup copy of my Neovim configuration after a major cleanup and switching from `init.vim` to `init.lua`.

> [Lazy.nvim](https://github.com/folke/lazy.nvim) requires Neovim >= 8.0. The latest release of Neovim that can be installed on [current Debian Stable](https://www.debian.org/News/2023/20230610.en.html) is [0.8.3](https://github.com/neovim/neovim/releases/tag/v0.8.3) (direct link to Debian package: https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb, https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb.sha256sum).

## Plugins

Some are new, some have been installed since Vim-6.5.something-something.

Simple single-file plugins, either semi-abandoned (i.e. not hosted on GH) or crapped-out by yours truly:

- [`plugin/Rename2.vim`](https://www.vim.org/scripts/script.php?script_id=2724): a small but (sometimes) convinient thingy for renaming currently open files
- `plugin/Wrap.vim`: word-wrapping mode (with altered keymapping to accomodate for visual lines) for `.md`'s, `.txt`'s, `.tex`'s, etc.; originally was a part of the good ol' `init.vim` (nee `~/.vimrc`)
- `plugin/EncodingMenu.vim`: menu for setting the correct character encoding mapped to `<F7>`; just some copypasta compiled from sources elsewhere (SO?); originally was a part of the good ol' `init.vim` (nee `~/.vimrc`)

Plugins managed by LazyVim:

- [goyo](https://github.com/junegunn/goyo.vim): distraction-free writing in Vim
- [bufexplorer](https://github.com/jlanzarotta/bufexplorer): quickly switch between buffers
- [Tabular](https://github.com/godlygeek/tabular): a relatively easy tool for aligning text
- [psql.vim](https://github.com/exu/pgsql.vim): Vim Postgresql syntax file (tuned to override system-wide SQL syntax settings: there must be _only one way to do stuff_ lol)
- [The NERD tree](https://github.com/preservim/nerdtree): a file system explorer
- [vim-move](https://github.com/matze/vim-move): move lines and selections in a visual manner
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi): multiple cursor for Vim
- [Darcula color scheme](https://github.com/doums/darcula): a nice (not so) dark colorscheme, a reproduction of the official JetBrains IDE Darcula theme
- [UltiSnips](https://github.com/SirVer/ultisnips): the ultimate solution for snippets in Vim.
  This _requires_ [pynvim](https://github.com/neovim/pynvim).

  On Arch/Manjaro:

  ```console
  # pacman -S python-pynvim
  ```

  On Debian/Ubuntu/etc.:

  ```console
  # apt install python3-pynvim
  ```

  May break any day regardless, because _Python_...
