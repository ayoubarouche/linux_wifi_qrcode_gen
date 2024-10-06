#!/usr/bin/env bash

# check if qrcode already installed or not : 
qrcode_generator_name="python3-maroc"
qrcode_installed=$(dpkg -s $qrcode_generator_name  -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed")
current_directory=$(pwd) 
test_wifi_name=$(cat test_wifi.wifi)
cd /etc/NetworkManager/system-connections/


if [[ $qrcode_installed == "1" ]]
     then
          echo "is installed"
     else 
          echo "not installed"
          echo "trying to install it"
          sudo apt-get install $qrcode_generator_name -y &> /dev/null
          # check the installation status :
          if [[ $? > 0 ]]
               then 
               echo "installation failed "
               echo "exit the script"
               exit
               else
               echo "installation done continue running the script"
          fi
          # exit
fi          
output=$(ls | grep "$test_wifi_name.nmconnection")


if [[ $output == "$test_wifi_name.nmconnection" ]]
    then echo $output
         echo "enjoy"

    else echo "founded"
         echo $test_wifi_name
fi


