function fish_mode_display
  set -l tomita_vi_mode "$TOMITA_VI"

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
end

function fish_git_status
  set -l vcs (fish_vcs_prompt 2>/dev/null)
  printf $vcs
end


function fish_prompt
  set -l tomita_vi_mode "$TOMITA_VI"

  set_color -o yellow 
  printf '%s:' (prompt_hostname)
  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color reset

  fish_git_prompt
  fish_mode_display
  
  set_color -o white
  printf ' λ '
  set_color reset

end
