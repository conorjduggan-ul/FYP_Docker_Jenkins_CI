# /bin/bash

CURRENT_DATE_TIME=$(date +"%Y-%m-%d_%H-%M-00")

FILEPATH="<REDACTED>"

/home/docker/gatherContainerCountMetrics/getContainerCount.sh > "${FILEPATH}${CURRENT_DATE_TIME}_Container_Count.txt"
/home/docker/gatherContainerCountMetrics/getHostOsMetrics.sh > "${FILEPATH}${CURRENT_DATE_TIME}_default3_OS_Metrics.txt"