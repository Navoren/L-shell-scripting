#!/bin/bash


create_directory(){
	mkdir demo
}

if ! create_directory; then
	echo "Code is exiting because the directory already exists"
	exit 1
fi	
