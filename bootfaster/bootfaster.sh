#!/bin/bash

# source: https://wiki.archlinux.org/title/improving_performance

# blacklist watchdog
# This help your linux can boot or shutdown faster

# wdctl to check watchdog is running
# unless it will print command not found

DISABLE_WATCHDOG_CONF_FILE="disable-sp5100-watchdog.conf"
DIR_MODEPRODE="/etc/modprobe.d"

if [ ! -f  $DIR_MODEPRODE$DISABLE_WATCHDOG_CONF_FILE ]; then

    cd  $DIR_MODEPRODE
    sudo touch $DISABLE_WATCHDOG_CONF_FILE

fi

cd  $DIR_MODEPRODE
sudo sh -c  "echo blacklist sp5100_tco >> $DISABLE_WATCHDOG_CONF_FILE"

# lsmod to  list all module
# blacklist module dont neccesary

#if dont use apple device , you can blacklist mac_hid
sudo sh -c  "echo blacklist mac_hid >> $DISABLE_WATCHDOG_CONF_FILE"


