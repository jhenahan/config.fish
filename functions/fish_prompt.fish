function fish_prompt

  function emacsen
    if set --query INSIDE_EMACS
      return 0
    else
      return 1
    end
  end

  function _git_branch_name
    echo (command git rev-parse --abbrev-ref HEAD ^/dev/null)
  end

  function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty ^/dev/null)
  end

  function _git_short_hash
    echo (command git rev-parse --short HEAD ^/dev/null)
  end
  
  if not emacsen
    function _rbenv_version
      echo (command rbenv version | awk '{print $1}')
    end

    function _pyenv_version
      echo (command pyenv version | awk '{print $1}')
    end

    function _plenv_version
      echo (command plenv version | awk '{print $1}')
    end

    function _php_version
      echo (command php -v | awk 'NR==1 {print $2}')
    end

    function _nodenv_version
      echo (command nodenv version | awk '{print $1}')
    end
  end

  switch $USER

  case root
    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end
  
  case '*'
    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end
  end

  set -l green (set_color green)
  set -l red (set_color red)
  set -l ugreen (set_color -u cyan)
  set -l normal (set_color normal)

  set -l arrow 'λ'
  set -l cwd $__fish_prompt_cwd(basename (prompt_pwd))$normal
  

  if [ (_git_branch_name) ]
    set git_info $green(_git_branch_name)
    set git_hash $ugreen(_git_short_hash)$normal
    set git_info ":$git_info$normal [$git_hash]"

    if emacsen
      set dirty " ☹ "
      set clean " ☺︎ "
    else
      set dirty "💔"
      set clean " 💔 "
    end
      
    if [ (_is_git_dirty) ]
      set git_info "$git_info$dirty "
    else
      set git_info "$git_info$clean "
    end
  end

  set -l git_info $git_info$normal
  
  if emacsen
    echo -e -n -s '正念 ' $cwd $git_info $arrow ' '
  else 
    set -l rbenv_info  ' ♦️ ' $red(_rbenv_version)$normal
    set -l pyenv_info  ' 🐍 ' $red(_pyenv_version)$normal
    set -l plenv_info  ' 🐪 ' $red(_plenv_version)$normal
    set -l php_info    ' 🐘 ' $red(_php_version)$normal
    set -l node_info   ' 🐹 ' $red(_nodenv_version)$normal

    echo -e -n -s '╭─ 正念 ' $cwd \
		  $git_info \
		  $rbenv_info \
		  $pyenv_info \
		  $plenv_info \
		  $php_info \
		  $node_info \
		  '\n╰─ ' $arrow ' '
  end
end
