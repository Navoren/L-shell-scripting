#!/bin/bash

<<disclaimer
Learning Conditioning
disclaimer

read -p "Enter name : " name

if [[ $name == "naman" ]];
then
	echo "welcome user"
else
	echo "you are not the user"
fi
