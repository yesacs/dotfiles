function fish_prompt
  set -l tomita_vi_mode "$TOMITA_VI"

  printf ' '
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
    set_color --bold brwhite
    switch $fish_bind_mode
      case default
        set_color -b green
        printf ' N '
      case insert
        set_color -b cyan
        printf ' I '
      case visual
        set_color -b yellow
        printf ' V '
    end
    set_color normal
  end
  
  set_color -o white
  printf ' ⋊> '
  set_color normal

end
