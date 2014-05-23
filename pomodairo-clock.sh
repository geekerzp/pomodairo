#! /bin/bash
#######################################################################
#     File Name           :     tomato_clock.sh
#     Created By          :     geekerzp
#     Creation Date       :     [2014-05-14 14:06]
#     Last Modified       :     [2014-05-23 18:10]
#     Description         :     自制番茄钟
#######################################################################

# If a link, fix the path
TURE_PATH=$(readlink -f $0 | xargs dirname)
cd $TURE_PATH

# setting back ground sound
if [ ! -z $1 ]; then
    SOUND=$1
else
    SOUND=Fire
fi

case $SOUND in
    Fire)
        SOUND_PATH="./assets/sounds/FireFinal15.mp3"
        ;;
    Birds)
        SOUND_PATH="./assets/sounds/BirdsFinal15.mp3"
        ;;
    Coffee)
        SOUND_PATH="./assets/sounds/CoffeeShopFinal15.mp3"
        ;;
    Fountain)
        SOUND_PATH="./assets/sounds/FountainFinal15.mp3"
        ;;
    Kids)
        SOUND_PATH="./assets/sounds/KidsFinal15.mp3"
        ;;
    Night)
        SOUND_PATH="./assets/sounds/NightFinal15.mp3"
        ;;
    Rain)
        SOUND_PATH="./assets/sounds/RainFinal15.mp3"
        ;;
    Train)
        SOUND_PATH="./assets/sounds/TrainFinal15.mp3"
        ;;
    Waves)
        SOUND_PATH="./assets/sounds/WavesFinal15.mp3"
        ;;
    WhiteNoise)
        SOUND_PATH="./assets/sounds/WhiteNoiseFinal15.mp3"
        ;;
    *)
        SOUND_PATH="./assets/sounds/FireFinal15.mp3"
        ;;
esac

# setting clock time
TIME=25
if [ ! -z $2 ] && [ $2 -gt 0 ] ; then
    TIME=$2
fi

# starting cmus as background
pkill -9 cmus
./cmus.sh
sleep 1s
# clear playlist, library, play queue
cmus-remote -c && cmus-remote -c -l && cmus-remote -c -q
# add sound to cmus
cmus-remote -q $SOUND_PATH
# play background sound
cmus-remote -p
# repeat play
sleep 1s
cmus-remote -R

# run
COMMAND="pkill -9 cmus && env DISPLAY=:0 feh ./assets/pics/tomato.jpg"
echo $COMMAND | at now+$TIME minutes

# log
echo "---------------------------------------------------------"
echo "               A pomodairo-clock                        "
echo "                                                        "
echo "               time: $TIME minutes                      "
echo "               backsound: $SOUND                        "
echo "---------------------------------------------------------"
