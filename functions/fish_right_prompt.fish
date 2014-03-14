function fish_right_prompt
  set -l exit_code $status
  set -l purple (set_color purple)
  set -l normal (set_color normal)

  
  if test $exit_code -ne 0
    set_color red
    printf '%d' $exit_code
    set_color normal
  else
    set_color -o green
    set -l succ "〇"
    printf '%s' $succ
    set_color normal
  end
  
  printf ' [%s] (%s)' $purple(date +%H:%M:%S)$normal $vi_mode
end