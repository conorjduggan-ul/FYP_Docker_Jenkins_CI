#! /bin/bash

FILEPATH="<REDACTED>"
CURRENT_TIME=$(date +"%Y_%m_%d_%H:%M:%S")

VM_INTERNAL_RESOURCE_USAGE_METRICS=$(VBoxManage metrics query JenkinsServerDebianBareMetalEnv CPU/Load/User:avg,CPU/Load/Kernel:avg,RAM/Usage/Used:avg)

 echo -e "${CURRENT_TIME}\n${VM_INTERNAL_RESOURCE_USAGE_METRICS}" >> "${FILEPATH}VmInternalMetrics.txt"