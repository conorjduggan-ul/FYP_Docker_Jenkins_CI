#! /bin/bash

JENKINS_PIPELNE_TO_CHECK=$1

PIPELINE_INFO_FILE_NAME=( $(aws s3 ls s3://jenkinslogstore/ | grep "${JENKINS_PIPELNE_TO_CHECK}" | awk -F" " '{print $4}') )

for logFile in "${PIPELINE_INFO_FILE_NAME[@]}"; do
	echo "Downloading ${logFile}"
	aws s3api get-object --bucket jenkinslogstore --key "${logFile}" "${logFile}" > /dev/null
done