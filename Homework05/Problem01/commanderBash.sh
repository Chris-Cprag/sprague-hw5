# This program will manioulate an LED based on the number
# of innvocations. One the first, the led will turn on, on 
# the second, the LED will turn off. On the third, the status
# of the LED will be read. On the fourth, the LED will flash.
# On the fifth, the LED will blink 3 times.
# Ex: ./commanderBash.sh 
# ----------------------------------------------------------------
LED3_PATH=/sys/class/leds/beaglebone\:green\:usr3

function removeTrigger
{
   echo "none" >> "$LED3_PATH/trigger"
}

if [ -f "innvocations.txt"  ]
  then
  count=$(cat "innvocations.txt")
  else
  count=0
fi

removeTrigger

if [ $count == 0 ]; then 
  echo "Turning LED On"
  ./led-hw4.sh on
  echo "1" > "innvocations.txt"
elif [ $count == 1 ]; then
  echo "Turning LED Off"
  ./led-hw4.sh off
  echo "2" > "innvocations.txt"
elif [ $count == 2 ]; then
  echo "Reading LED Status"
  echo $(cat "$LED3_PATH/brightness")
  echo "3" > "innvocations.txt"
elif [ $count == 3 ]; then
  echo "Flashing LED"
  echo "1" >> "$LED3_PATH/brightness"
  sleep 1 
  echo "0" >> "$LED3_PATH/brightness"
  sleep 1
  echo "4" > "innvocations.txt"
elif [ $count == 4 ]; then
  echo "Blink the LED 3 times"
  ./led-hw4.sh blink 3
  echo "0" > "innvocations.txt"
fi
