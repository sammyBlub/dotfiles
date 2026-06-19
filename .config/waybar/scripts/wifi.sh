ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)

if [ -z "$ssid" ]; then
  echo '{"text":"󰖪 Disconnected","class":"disconnected"}'
  exit 0
fi

masked=""
len=${#ssid}

for ((i=0; i<len; i++)); do
  if [ $i -lt 3 ]; then
    masked+="${ssid:$i:1}"
  else
    masked+="*"
  fi
done

echo "{\"text\":\"  $masked\",\"class\":\"wifi\"}"
