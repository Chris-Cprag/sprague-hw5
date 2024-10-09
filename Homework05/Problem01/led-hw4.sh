# The program takes two arguments blink and n. Blink specificies
#   that you would like the LED to blink, n specifies the number of 
#   times you'd like it to blink.
#   Ex: ./led-hw4.sh blink 5
# ---------------------------------------------------------------------
LED3_PATH=/sys/class/leds/beaglebone\:green\:usr3

function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " led-hw4.bh Blink N \n  where blink can be either be"
  echo -e "   on, off, or blink. n can be the number of times"
  echo -e " you want it to blink"
  echo -e "e.g ./led-hw4.sh blink 5"
  exit 2
fi
echo "The LED Command that was passed is: $1"
if [ "$1" == "on" ]; then
  echo "Turning the LED on"
  removeTrigger
  echo "1" >> "$LED3_PATH/brightness"
elif [ "$1" == "off" ]; then
  echo "Turning the LED off"
  removeTrigger
  echo "0" >> "$LED3_PATH/brightness"

elif [ $1 == "blink" ]; then
  echo "Blinking LED"
  removeTrigger
  i=0
  while [ $2 -gt  $i ]
    do
       echo "1" >> "$LED3_PATH/brightness"
       sleep 1
       echo "0" >> "$LED3_PATH/brightness"
       sleep 1
      ((i++))
      echo "Blinked"
  done
fi
echo "End of the LED Bash Script"
