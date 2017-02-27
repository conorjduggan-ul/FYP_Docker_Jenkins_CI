#! /bin/bash

SEMATEXT_FILE_TO_CHECK="SemaTextData-2017-02-25"

SEMATEXT_METRIC_FILE_NAME=( $(aws s3 ls s3://dockeragentmetrics/ | grep "${SEMATEXT_FILE_TO_CHECK}" | awk -F" " '{print $4}') )

for metricFile in "${SEMATEXT_METRIC_FILE_NAME[@]}"; do
	echo "Downloading ${metricFile}"
	aws s3api get-object --bucket dockeragentmetrics --key "${metricFile}" SemaText_Metrics/"${metricFile}" > /dev/null
done