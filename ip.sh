#!/bin/bash
set -e

cd "$(dirname "$0")"

#####
#Save current and old IP
#####

#Settings
xdate="$(date "+[%Y-%m-%d %H:%M:%S]")"

#c=current
#if file doesn't exit create
cip_file="ip.txt"
if [ ! -e $cip_file ]; then
  echo -e "IP file not found! \nCreate IP file"
  echo "1.1.1.1" > $cip_file
fi

#got current ip adresse
#if file doesn't exit create
cip="$(curl --silent https://ifconfig.me/ip)"

#l=last
lip_file="l_ip.txt"
if [ ! -e $lip_file ]; then
  echo -e "Last IP file not found! \nCreate Last IP file";
  echo "$cip" > $lip_file
fi

#o=old
#if file doesn't exit create
oip_file="ip_old.txt"
if [ ! -e $oip_file ]; then
  echo -e "Old IP file not found! \necho Create Last IP file"
  echo "$xdate - " > $oip_file
fi

#check changes, if exist set new ip to last
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
