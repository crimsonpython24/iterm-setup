if status is-interactive
    # Commands to run in interactive sessions can go here
end

export HOMEBREW_NO_AUTO_UPDATE=1

function fish_greeting
    echo '                 '(set_color F00)'___
  ___======____='(set_color FF7F00)'-'(set_color FF0)'-'(set_color FF7F00)'-='(set_color F00)')
/T            \_'(set_color FF0)'--='(set_color FF7F00)'=='(set_color F00)')
[ \ '(set_color FF7F00)'('(set_color FF0)'0'(set_color FF7F00)')   '(set_color F00)'\~    \_'(set_color FF0)'-='(set_color FF7F00)'='(set_color F00)')
 \      / )J'(set_color FF7F00)'~~    \\'(set_color FF0)'-='(set_color F00)')
  \\\\___/  )JJ'(set_color FF7F00)'~'(set_color FF0)'~~   '(set_color F00)'\)
   \_____/JJJ'(set_color FF7F00)'~~'(set_color FF0)'~~    '(set_color F00)'\\
   '(set_color FF7F00)'/ '(set_color FF0)'\  '(set_color FF0)', \\'(set_color F00)'J'(set_color FF7F00)'~~~'(set_color FF0)'~~     '(set_color FF7F00)'\\
  (-'(set_color FF0)'\)'(set_color F00)'\='(set_color FF7F00)'|'(set_color FF0)'\\\\\\'(set_color FF7F00)'~~'(set_color FF0)'~~       '(set_color FF7F00)'L_'(set_color FF0)'_
  '(set_color FF7F00)'('(set_color F00)'\\'(set_color FF7F00)'\\)  ('(set_color FF0)'\\'(set_color FF7F00)'\\\)'(set_color F00)'_           '(set_color FF0)'\=='(set_color FF7F00)'__
   '(set_color F00)'\V    '(set_color FF7F00)'\\\\'(set_color F00)'\) =='(set_color FF7F00)'=_____   '(set_color FF0)'\\\\\\\\'(set_color FF7F00)'\\\\
          '(set_color F00)'\V)     \_) '(set_color FF7F00)'\\\\'(set_color FF0)'\\\\JJ\\'(set_color FF7F00)'J\)
                      '(set_color F00)'/'(set_color FF7F00)'J'(set_color FF0)'\\'(set_color FF7F00)'J'(set_color F00)'T\\'(set_color FF7F00)'JJJ'(set_color F00)'J)
                      (J'(set_color FF7F00)'JJ'(set_color F00)'| \UUU)
                       (UU)

	'(set_color normal)
end

# alias --save ls "lsd -aFl --icon never --date relative --size short --blocks "permission,size,date,name,inode""
# alias --save ut "upto"
# alias --save python "python3"
# alias --save pip "pip3"
# alias --save vim "vim"
# alias --save vi "vim"
abbr -a speedtest "for i in (seq 1 10); /usr/bin/time fish -i -c exit; end"
abbr -a dnsc_stat "sudo lsof +c 15 -Pni UDP:53"

set -gx  LC_ALL en_US.UTF-8  
set -x EDITOR vim
set fish_syntax_highlighting
set fish_autosuggestions

fish_default_key_bindings
fzf_configure_bindings --variables=\cv --directory=\cf --git_log=\cg --history=\cr

bind \x7f _autopair_backspace
bind -k backspace _autopair_backspace
bind \t _autopair_tab
bind '(' _autopair_insert_left\ \\\(\ \\\)
bind ')' _autopair_insert_right\ \\\)
bind '[' _autopair_insert_left\ \\\[\ \\\]
bind ']' _autopair_insert_right\ \\\]
bind '{' _autopair_insert_left\ \\\{\ \\\}
bind '}' _autopair_insert_right\ \\\}
bind '"' _autopair_insert_same\ \\\"
bind \' _autopair_insert_same\ \\\'

# tide prompt options
set -g tide_prompt_add_newline_before false
set -g tide_left_prompt_frame_enabled true
set -g tide_left_prompt_items status vi_mode context pwd aws chruby crystal docker go java kubectl nix_shell node php private_mode rustc terraform toolbox virtual_env git
set -g tide_left_prompt_suffix 
set -g tide_right_prompt_frame_enabled true
set -g tide_right_prompt_prefix
set -g tide_right_prompt_suffix
set -g tide_right_prompt_items time

set -g tide_status_bg_color EEEEEE
set -g tide_status_bg_color_failure EEEEEE
set -g tide_status_color 222222
set -g tide_status_color_failure FF0000
set -g tide_pwd_bg_color 333333
set -g tide_context_always_display true
set -g tide_context_bg_color CCCCCC
set -g tide_context_color_default 005282
set -g tide_context_hostname_parts 1
set -g tide_status_icon '0'
set -g tide_status_icon_failure
set -g tide_time_bg_color normal
set -g tide_time_color 777777
set -g tide_time_format '%H:%M:%S'

# custom function to show input mode
# function _tide_item_bind_mode
#   switch $fish_bind_mode
#     case default
#       _tide_print_item bind_mode $tide_example_icon' ' "D"
#     case insert
#       _tide_print_item bind_mode $tide_example_icon' ' "I"
#     case replace_one
#       _tide_print_item bind_mode $tide_example_icon' ' "R"
#     case visual
#       _tide_print_item bind_mode $tide_example_icon' ' "V"
#     case '*'
#       _tide_print_item bind_mode $tide_example_icon' ' "?"
#   end
# end
# funcsave _tide_item_bind_mode
set -g tide_bind_mode_color 222222
set -g tide_bind_mode_bg_color 888888
set -g tide_bind_mode_icon ''
set --prepend tide_left_prompt_items bind_mode

# Setting PATH for Python 3.12
# The original version is saved in /Users/warren/.config/fish/config.fish.pysave
# set -x PATH "/Library/Frameworks/Python.framework/Versions/3.12/bin" "$PATH"
