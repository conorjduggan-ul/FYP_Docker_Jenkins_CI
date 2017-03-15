#! /bin/bash

FILEPATH="<REDACTED>"
CURRENT_TIME=$(date +"%Y_%m_%d_%H:%M:%S")

HOST_RESOURCE_USAGE_METRICS=$(ps aux | grep "JenkinsServerDebianBareMetalEnv" | head -n 1 | awk -F" " '{print $3,$4}')

 echo "${CURRENT_TIME},${HOST_RESOURCE_USAGE_METRICS}" >> "${FILEPATH}hostCpuRam.txt"