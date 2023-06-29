function ls --wraps='exa -1 -l -F -h -a --git --color always --no-permissions --time-style default --sort name --group-directories-first' --description 'alias ls exa -1 -l -F -h -a --git --color always --no-permissions --time-style default --sort name --group-directories-first'
  exa -1 -l -F -h -a --git --color always --no-permissions --time-style default --sort name --group-directories-first $argv
        
end
