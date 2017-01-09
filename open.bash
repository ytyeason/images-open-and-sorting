#!/bin/bash

#TONGYOU YANG 260669495

pics=`ls *.dat | cut -d'.' -f1`

ps | grep 'eog' > mission


b=`wc -l mission | cut -d' ' -f1`

number=`expr "$b" "+" "$1"`

a=0

while [ 1 ]
do 

if [ "$a" -lt "$number" ]
then
  pic=`echo $pics | cut -d' ' -f1 `
  eog -n $pic.jpg &

  pics="`echo $pics | cut -d' ' -f2-` ${pic} "

  ps | grep 'eog' > mission
  a=`wc -l mission | cut -d' ' -f1`

fi

ps | grep 'eog' > mission
a=`wc -l mission | cut -d' ' -f1`

done
