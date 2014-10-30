#!/bin/sh
# Starts a timer with a precison of 5 seconds.
# When the time goes by,
# it will play sound.

# get user input
echo "Timer with a precison of 5 seconds."
read -p "Timer for how many minutes? " DURATION


DURATION=$(($DURATION * 60))


# get start time since 1970-01-01 00:00:00 UTC
START=$(date +%s)


while [ 1 ]; do
    #clear # clear window
    NOW=$(date +%s)
    DIFF=$(( $NOW - $START))
    ELAPSE=$(( $DURATION - $DIFF ))
    MINS=$(( $ELAPSE / 60 ))  # Division with integer e.g. 65 / 10 = 6
    SECS=$(( $ELAPSE - ($MINS * 60) ))
    
    if [ $SECS -le 0 ] && [ $MINS -le 0 ] 
    then
        echo "playing a song..." # e.g with mpg123
        mpg123 -q ~/heli.mp3
        break
    else
        echo "$MINS:$SECS"
        sleep 5 # Sleep for 5 seconds to save cpu time.
                # A precision of 5 seconds is good enough for me.
    fi
done
