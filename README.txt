1. Change the font to source code pro + bundled nerd font (TTF in the "tweaks/iterm" desktop folder)
2. Brew packages
     - exa: "ls" replacement [alias --save ls exa -1 -l -F -h -a --git --color always --no-permissions --time-style default --sort name --group-directories-first]
     - git-delta: highlights, coloring, and more in git diff [create "~/.gitignore" with all the tweaks]
     - [manual install] peco: interactive filter, usage e.g., ps aux | peco
3. Install fisher (extension manager)
     - patrickf1/colored_man_pages.fish (the name suggests)
     - jorgebucaran/nvm.fish (Node.js version manager; install official package and use system)
     - markcial/upto (goes to any parent folder, override fish alias "ut" --save)
     - PatrickF1/fzf.fish (fuzzy finder, depends on brew packages fzf, bat, and fd)
          \cg: look for git stuffs, \cf: find file, \cv: environment variables, \cr: command history
     - jorgebucaran/autopair.fish (pairs syntax, manually add lacking "bind" keybinds in config)
     - edc/bass (transports bash-only commands onto fish, can try with virtualenv)
     - meaningful-ooo/sponge (cleans out incorrect commands "127" besides the most recent two)
     - nickeb96/puffer-fish (for !! and !$, which are not shipped in fish)
     - ilancosman/tide@v5 (theming)
4. Theme: customized Tide, see config.fish and the bind_mode custom function for more details
