function fish_prompt
  set -l tomita_vi_mode "$TOMITA_VI"

  set_color -b brblack
  if test -z (string match -ri '^no|false|0$' $tomita_vi_mode)
    switch $fish_bind_mode
      case default
        set_color green
      case insert
        set_color cyan
      case visual
        set_color yellow
    end
    printf '⋊>'
    set_color normal
  end

  printf ' '
  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)

  if git_is_repo
    set_color white
    printf ' on '

    set_color yellow
    printf '%s' (git_branch_name)
  end

  set_color -o white
  printf ' λ '
  set_color normal
end
