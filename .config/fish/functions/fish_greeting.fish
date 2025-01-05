function fish_greeting
  set user (set_color blue)$USER(set_color normal)
  set host (set_color blue)(hostname | string replace -r '.(local|lan)$' '')(set_color normal)
  set datetime (set_color green)(date +"%Y-%m-%d %H:%M")(set_color normal)
  printf "%s@%s 󱢺 %s\n\n" "$user" "$host" "$datetime"
end
