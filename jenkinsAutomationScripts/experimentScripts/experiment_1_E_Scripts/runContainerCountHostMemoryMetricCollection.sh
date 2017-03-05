# /bin/bash

CURRENT_DATE_TIME=$(date +"%Y-%m-%d_%H-%M-00")

FILEPATH="<REDACTED>"

/home/docker/experiment1E/getContainerCount.sh > "${FILEPATH}${CURRENT_DATE_TIME}_Container_Count.txt"
/home/docker/experiment1E/getHostOsMetrics.sh > "${FILEPATH}${CURRENT_DATE_TIME}_concurrentTestingDockerMachine_OS_Metrics.txt"
