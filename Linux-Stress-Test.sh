#!/bin/bash

cpucores=$(nproc)

if ! command -v glxgears >/dev/null; then
    sudo apt install mesa-utils -y >/dev/null
fi

if ! command -v cowsay >/dev/null; then 
    sudo apt install cowsay -y >/dev/null
fi
if ! command -v stress >/dev/null; then
    sudo apt install stress -y >/dev/null
fi

clear -x 
cowsay -f tux """Made by CleanMachine1

Scroll up at any point to see previous outputs
"""

sleep 2 
clear -x 
cowsay -f tux "Made by CleanMachine1"
echo "1 = All tests - (Default)"
echo "2 = CPU"
echo "3 = GPU"
echo "Anything other than 1, 2 or 3 will result with running all tests"
read -r -p "Enter a valid number from the choices above" question1
clear -x 

if [ $question1 = "2" ]; then
cowsay -f tux "Made by CleanMachine1"
echo "Starting CPU Stress"
sleep 1
stress --cpu $cpucores --timeout 90 >>./results.txt
currenttemp=$(cat /sys/class/thermal/thermal_zone0/temp)
echo "The CPU is currently at $currenttemp after running the test (Divide by 1000 to get C temp)"
echo "The CPU is currently at $currenttemp after running the test (Divide by 1000 to get C temp)" >>./results
echo "The results have been writen to your current working directory"
sleep 5 
exit

elif [ $question1 = "3" ]; then
cowsay -f tux "Made by CleanMachine1"
echo "Starting GPU Stress"
sleep 1
timeout 20s glxgears -fullscreen >>./results.txt
echo "The results have been writen to your current working directory"
sleep 5
exit

else 

echo "Starting CPU Stress"
sleep 1
stress --cpu $cpucores --timeout 90 >>./results.txt
currenttemp=$(cat /sys/class/thermal/thermal_zone0/temp / 1000)
echo "The CPU is currently at $currenttemp after running the test (Divide by 1000 to get C temp)"
echo "The CPU is currently at $currenttemp after running the test (Divide by 1000 to get C temp)" >>./results.txt
echo "The results have been writen to your current working directory"
echo "END OF CPU STRESS"
echo "Starting GPU Stress"
echo "This takes 20 seconds!"
sleep 5

timeout 20s glxgears -fullscreen >>./results.txt
echo "The results have been writen to your current working directory"
sleep 5
exit
fi