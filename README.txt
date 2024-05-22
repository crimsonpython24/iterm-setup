-Shell-
1. Change the font to source code pro + bundled nerd font (TTF in the "tweaks/iterm" desktop folder)
2. Brew packages
     - lsd: replacement for exa for a fancier "ls" command
     - git-delta: highlights, coloring, and more in git diff [create "~/.gitignore" with all the tweaks]
     - peco: interactive filter, usage e.g., ps aux | peco
3. Install languages: python, node
4. Install fisher (extension manager)
     - patrickf1/colored_man_pages.fish (the name suggests)
     - jorgebucaran/nvm.fish (Node.js version manager; install official package and use system)
     - markcial/upto (goes to any parent folder, override fish alias "ut" --save)
     - PatrickF1/fzf.fish (fuzzy finder, depends on brew packages fzf, bat, and fd)
          \cg: look for git stuffs, \cf: find file, \cv: environment variables, \cr: command history
     - jorgebucaran/autopair.fish (pairs syntax, manually add lacking "bind" keybinds in config)
     - edc/bass (transports bash-only commands onto fish, can try with virtualenv)
     - meaningful-ooo/sponge (cleans out incorrect commands "127" besides the most recent two) *might not be needed
     - nickeb96/puffer-fish (for !! and !$, which are not shipped in fish)
     - ilancosman/tide@v5 (theming)
5. Theme: customized Tide, see config.fish and the bind_mode custom function for more details

-Vim- amix/vimrc, might need more config

-nVim-
[https://github.com/josean-dev/dev-environment-files]

Debug notes:
     - :TSInstall markdown markdown_inline
     - Run :Mason to view all downloads, :MasonLog for history, and :MasonInstall to make up
     - pyre requires python to be installed beforehand
     - packer will be installed automatically once neovim is launched

Setup guides:
     - luasnip     [https://www.ejmastnak.com/tutorials/vim-latex/luasnip/]
     - vimtex      [https://github.com/lervag/vimtex] should be enough, use above link for keybinds
     - latexindent [https://latexindentpl.readthedocs.io/en/latest/sec-default-user-local.html]
