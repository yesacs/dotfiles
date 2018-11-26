function fish_prompt
  set -l tomita_vi_mode "$TOMITA_VI"

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)

  if git_is_repo
    set_color white
    printf ' on '

    set_color yellow
    printf '%s' (git_branch_name)
  end

  if test -z (string match -ri '^no|false|0$' $tomita_vi_mode)
    printf ' '
    switch $fish_bind_mode
      case default
        set_color -o green
        printf '[N]'
      case insert
        set_color -o cyan
        printf '[I]'
      case visual
        set_color -o red
        printf '[V]'
      case replace_one
        set_color -o yellow
        printf '[R]'
    end
    set_color normal
  end
  
  set_color -o white
  printf ' ⋊> '
  set_color normal

end
