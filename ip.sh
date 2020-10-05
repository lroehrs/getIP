#!/bin/bash
set -e
#####
#Save current and old IP
#####

#Settings
work_path="/opt/app/getIP/"
xdate="$(date "+[%Y-%m-%d %H:%M:%S]")"
cd $work_path

#c=current
cip_file="ip.txt"
if [ ! -e $cip_file ]; then
  echo -e "IP file not found! \nCreate IP file"
  echo "1.1.1.1" > $lip_file
fi

cip="$(curl --silent ifconfig.me/ip)"

#l=last
lip_file="l_ip.txt"
if [ ! -e $lip_file ]; then
  echo -e "Last IP file not found! \nCreate Last IP file";
  echo "$cip" > $lip_file
fi

#o=old
oip_file="ip_old.txt"
if [ ! -e $oip_file ]; then
  echo -e "Old IP file not found! \necho Create Last IP file"
  echo "$xdate - " > $oip_file
fi

if [ $cip = $(cat ip.txt) ]; then
  echo -e "Current IP is equal to last, noting to do. \nBye!"
else
  echo "IP Changed! $(cat ip.txt)  -> $cip "
  echo "Save last ip in $oip_file"
  echo "$xdate $(cat ip.txt)" >> $oip_file
  echo "Set current IP!"
  echo "$cip" > $cip_file
  echo "$cip" > $lip_file
fi
