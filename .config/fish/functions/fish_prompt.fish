function fish_prompt -d "Write out the prompt"
  set -g __fish_git_prompt_showupstream auto
  printf '%s%s%s%s\n' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (fish_git_prompt)
  printf '󰈺  ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end
