#!/bin/bash
num=2
while [ $num -eq 2 ] do
read -p " enter a number" num
if [ $num -eq 2 ]; then
break
fi
done
