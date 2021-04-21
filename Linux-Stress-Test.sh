#!/bin/bash

if ! command -v glxgears >/dev/null; then
    sudo apt install mesa-utils -y
fi

if ! command -v cowsay >/dev/null; then 
    sudo apt install cowsay -y
fi
if ! command -v stress >/dev/null; then
    sudo apt install stress -y
fi