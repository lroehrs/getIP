#!/bin/bash
set -e

cd "$(dirname "$0")"

#####
#Save current and old IPv6
#####

#Settings
xdate="$(date "+[%Y-%m-%d %H:%M:%S]")"

#c=current
#if file doesn't exit create
cip_file="ip6.txt"
if [ ! -e $cip_file ]; then
  echo -e "IP file not found! \nCreate IP file"
  echo "1.1.1.1" > $cip_file
fi

#got current ip adresse
#if file doesn't exit create
cip="$(curl --silent -6 icanhazip.com)"

#l=last
lip_file="/tmp/l_ip6.txt"
if [ ! -e $lip_file ]; then
  echo -e "Last IPv6 file not found! \nCreate Last IPv6 file";
  echo "$cip" > $lip_file
fi

#o=old
#if file doesn't exit create
oip_file="/tmp/ip6_old.txt"
if [ ! -e $oip_file ]; then
  echo -e "Old IPv6 file not found! \necho Create Last IPv6 file"
  echo "$xdate - " > $oip_file
fi

#check changes, if exist set new ip to last
if [ $cip = $(cat ip6.txt) ]; then
  echo -e "Current IPv6 is equal to last, noting to do. \nBye!"
else
  echo "IPv6 Changed! $(cat ip.txt)  -> $cip "
  echo "Save last IPv6 in $oip_file"
  echo "$xdate $(cat ip.txt)" >> $oip_file
  echo "Set current IP!"
  echo "$cip" > $cip_file
  echo "$cip" > $lip_file
fi