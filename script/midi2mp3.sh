#!/bin/bash

FILE=${1}
if [[ -z "${FILE}" ]] ; then

        echo "Please give the midi file name!"

        exit -1

fi
MP3FILE=${FILE%%.mid}.mp3
WAVFILE=${FILE%%.mid}.wav
fluidsynth -F ${WAVFILE} /usr/share/sounds/sf2/FluidR3_GM.sf2 ${FILE} &&
lame --preset standard ${WAVFILE} ${MP3FILE} &&
rm ${WAVFILE} &&
mv ${MP3FILE} ../mp3/
echo "Convert Success!\n"

# EOF
