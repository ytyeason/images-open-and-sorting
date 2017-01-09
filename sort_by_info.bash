#!/bin/bash

#TONGYOU YANG 260669495

pics=`ls *.dat | cut -d'.' -f1`

a=1


while [ "$a" -lt "9"  ]
do
  name=`echo $pics | cut -d' ' -f$a `
  file=$name
  weight=`cat $file.dat | cut -d' ' -f1 `
  length=`cat $file.dat | cut -d' ' -f2 `
  echo $name >> name.txt
  echo $weight $name >> weight.txt
  echo $length $name >> length.txt


  a=`expr "$a" "+" "1"`

done

cat name.txt | sort | cut -d' ' -f2 > sorname.txt
cat weight.txt | sort -n | cut -d' ' -f2 > sorwei.txt
cat length.txt | sort -n | cut -d' ' -f2 > sorlen.txt

sorname=""
sorwei=""
sorlen=""

b=8
while [ "$b" -gt "0" ]
do
  c=`tail -n $b sorname.txt | head -n 1 `
  d=`tail -n $b sorwei.txt | head -n 1 `
  e=`tail -n $b sorlen.txt | head -n 1 `

  sorname="$sorname $c.jpg"
  sorwei="$sorwei $d.jpg"
  sorlen="$sorlen $e.jpg"

  echo $c >> sornamelist
  echo $d >> sorweilist
  echo $e >> sorlenlist
  

  b=`expr "$b" "-" "1"`
done

  input=$1

  if [ "$input" == "alpha" ]
  then
   cat sornamelist
   convert -append $sorname result.jpg
  fi
  
  if [ "$input" == "weight" ]
  then 
    cat sorweilist
    convert -append $sorwei result.jpg
  fi

  if [ "$input" == "length" ]
  then 
    cat sorlenlist
    convert -append $sorlen result.jpg
  fi

  rm name.txt
  rm weight.txt
  rm length.txt

  rm sornamelist
  rm sorweilist
  rm sorlenlist

  eog -n result.jpg
