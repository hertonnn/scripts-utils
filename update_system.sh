#!/usr/bin/env bash
# ------------------------------------------------------------------------ #
# Script Name:   update-system.sh
# Description:   Update the systems
# Written by:    Herton Silveira
# Maintenance:   Herton Silveira
# ------------------------------------------------------------------------ #
# Usage:
#       $ ./system-backup.sh
# ------------------------------------------------------------------------ #
# Tested on:
#       Bash 4.2.46
# ------------------------------------------------------------------------ #
# History:      
# ------------------------------------------------------------------------ #
# Thankfulness: 
#
#VARIABLES --------------------------------------------------------------- #
#
#FUNCTIONS
#
#CODE
sudo apt update ; apt upgrade -y
sudo apt list --upgradable
sudo apt  autoremove -y
sudo apt clean
echo "System update completed!"
#END --------------------------------------------------------------------- #
