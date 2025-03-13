#!/bin/bash

# Matrix-style scrolling text effect
while true; do
    printf "\e[32m%s\e[0m\n" "$(date) 💀 💀 💀 $(openssl rand -hex 8)"
    sleep 0.05 
done

