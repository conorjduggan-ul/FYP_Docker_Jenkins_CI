# !/bin/bash

EXPERIMENT_5_A_STORAGE_FILEPATH="<REDACTED>/Experiment_5_A_Timings.txt"

CURRENT_DATE_TIME=$(date +%s)

DOCKER_PRINTED_TIME=$(docker run -i -t conor-jenkins-agent:2.3 su - jenkins -c "date +%s")

echo -e "${CURRENT_DATE_TIME},${DOCKER_PRINTED_TIME}" >> "${EXPERIMENT_5_A_STORAGE_FILEPATH}"