# NOTE: macOS only.

function wifi
  set airport "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

  if not test -f $airport
    echo (set_color red) "✕ can't find `airport` program at $airport." (set_color normal)
    return 1
  end

  set ssid (eval $airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')

  if not test -n "$ssid"
    echo (set_color red) "✕ can't find wifi network." (set_color normal)
    return 1
  end

  echo (set_color brblack) "… getting password for $ssid." (set_color normal)

  set password (security find-generic-password -wa $ssid)

  if test -n "$password"
    echo (set_color cyan) "✓ $password" (set_color normal)
  else
    echo (set_color red) "✕ permission denied." (set_color normal)
    return 1
  end
end
