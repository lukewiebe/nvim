# Hi There

You’ve found my Neovim config. How exciting!

Here are a few of the important files:

- `./init.lua` sets a bunch of settings and `require`s some modules (which are located in `./lua/`).
- [MiniDeps](https://github.com/echasnovski/mini.deps) is my plugin manager, so `./lua/mini-deps.lua` manages all my plugins.
- Plugins that need setup get their own file in `./plugin/`, each of which is automatically called during startup.
- My LSP configuration is in `./after/ftplugin/<filetype>.lua`, and keybinds are set via autocommand in `./lua/lsp.lua`.

My goal with this setup is to use a small number of plugins while still being fully-featured. I'm happy to take a 90% solution if it means I can use the defaults or a simpler plugin.
