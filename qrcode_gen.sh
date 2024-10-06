#!/usr/bin/env bash
current_directory=$(pwd) 
test_wifi_name=$(cat test_wifi.wifi)
cd /etc/NetworkManager/system-connections/
output=$(ls | grep "$test_wifi_name.nmconnection")


if [[ $output == "$test_wifi_name.nmconnection" ]]
    then echo $output
         echo "enjoy"

    else echo "founded"
         echo $test_wifi_name
fi


