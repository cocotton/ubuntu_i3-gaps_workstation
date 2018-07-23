#!/bin/dash
city="Montreal,CA"
api_key="39214b9803f123f428d81d0e38c1af9c"
lang="us"
unit="metric"
api="http://api.openweathermap.org/data/2.5/weather"
url="$api?q=$city&lang=$lang&APPID=$api_key&units=$unit"

temp=$(curl -s $url | jq -r '. | "\(.main.temp)"')
icons=$(curl -s $url | jq -r '. | "\(.weather[0].icon)"')

case $icons in
  01d) icon="";;
  01n) icon="";;
  02d) icon="";;
  02n) icon="";;
  03*) icon="";;
  04*) icon="";;
  09*) icon="";;
  10d) icon="";;
  10n) icon="";;
  11*) icon="";;
  13*) icon="";;
  50*) icon="";;
  *) icon="";;
esac

printf "$icon %.*f°C" 0 $temp
