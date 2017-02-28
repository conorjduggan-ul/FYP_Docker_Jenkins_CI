# !/bin/bash

DOCKER_MACHINE_FILEPATH="<REDACTED>/.docker/machine/machines/"
DOCKER_MACHINE_NAME="concurrentFitnesseTestingDockerMachine"
EXPERIMENT_12_A_STORAGE_FILEPATH="<REDACTED>/Experiment_12_A_Docker_Machine_Disk_Usage.txt"

date +"%Y-%m-%d %H:%M:%S" >> "${EXPERIMENT_12_A_STORAGE_FILEPATH}"

ll "${DOCKER_MACHINE_FILEPATH}" | grep "${DOCKER_MACHINE_NAME}" >> "${EXPERIMENT_12_A_STORAGE_FILEPATH}"

echo -e "\n\n" >> "${EXPERIMENT_12_A_STORAGE_FILEPATH}"