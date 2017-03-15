#! /bin/bash

FILEPATH="<REDACTED>"
CURRENT_TIME=$(date +"%Y_%m_%d_%H:%M:%S")

VM_DISK_SIZE=$(du -sk /Users/conorduggan/VirtualBox\ VMs/JenkinsServerDebianBareMetalEnv/ | grep "G" | awk -F" " '{print $1}')

 echo "${CURRENT_TIME},${VM_DISK_SIZE}" >> "${FILEPATH}VmDiskSize.txt"