#!/bin/sh

INTERFACE=$1
NETWORK=$2
NETMASK=$3
TIME=$4
HOSTS=`nmap -sL -n $NETWORK | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | grep -v '[255]$'`
for i in $HOSTS; do
    /sbin/ifconfig $INTERFACE $i netmask $NETMASK up
    sleep $TIME
done
