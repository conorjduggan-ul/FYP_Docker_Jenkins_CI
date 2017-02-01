###
#       Author: Conor Duggan
#       Email: 13127004@studentmail.ul.ie
#
#       Project Title: FYP Jenkins Automation Script
#
#       Usage: Run script passing in the pipeline to gather info on the docker agents used for its last run. 
#               e.g. ./gatherSemaTextData.sh Pipeline_1
###

#! /bin/bash

JENKINS_PIPELINE_TO_CHECK=$1
API_KEY=$2
APP_TOKEN=$3

runSemaTextCurlForDockerAgents() {

	metricToCurl=$1
	containersToCheck=$2
	date=$3
	startTime=$4
	endTime=$5

	curl -X POST -k -H "Content-Type: application/json" "https://apps.sematext.com/spm-reports/api/v2/metrics/data" -d "
	{
	  \"apiKey\" : \"${API_KEY}\",
	  \"appToken\" : \"${APP_TOKEN}\",
	  \"metric\" : \"${metricToCurl}\",
	  \"start\" : \"${date} ${startTime}\",
	  \"end\" : \"${date} ${endTime}\",
	  \"granularity\": \"ONE_MINUTE\",
	  \"filters\" : {
	    \"dockerContainerIdNameFilter\" : {\"values\":[\"${containersToCheck}\"]}
	  }
	}"
}

runSemaTextCurlForHost() {

	metricToCurl=$1
	date=$2
	startTime=$3
	endTime=$4

	curl -X POST -k -H "Content-Type: application/json" "https://apps.sematext.com/spm-reports/api/v2/metrics/data" -d "
	{
	  \"apiKey\" : \"${API_KEY}\",
	  \"appToken\" : \"${APP_TOKEN}\",
	  \"metric\" : \"${metricToCurl}\",
	  \"start\" : \"${date} ${startTime}\",
	  \"end\" : \"${date} ${endTime}\",
	  \"granularity\": \"ONE_MINUTE\"
	}"
}

# Get the name of the last pipeline extecution time txt file uploaded to AWS for pipeline
PIPELINE_INFO_FILE_NAME=$(aws s3 ls s3://jenkinspipelineduration/ | tac | grep "${JENKINS_PIPELINE_TO_CHECK}" | head -n 1 | awk -F " " '{print $4}')

# Download the info file for the pipeline
aws s3api get-object --bucket jenkinspipelineduration --key "${PIPELINE_INFO_FILE_NAME}" "${PIPELINE_INFO_FILE_NAME}" > /dev/null

# Extract Pipeline run date, start and end times from file name
PIPELINE_RUN_YEAR=$(echo "${PIPELINE_INFO_FILE_NAME}" | awk -F "-" '{print $2}' | awk -F "_" '{print $1}')
PIPELINE_RUN_MONTH=$(echo "${PIPELINE_INFO_FILE_NAME}" | awk -F "-" '{print $2}' | awk -F "_" '{print $2}')
PIPELINE_RUN_DAY=$(echo "${PIPELINE_INFO_FILE_NAME}" | awk -F "-" '{print $2}' | awk -F "_" '{print $3}')
PIPELINE_RUN_DATE="${PIPELINE_RUN_YEAR}-${PIPELINE_RUN_MONTH}-${PIPELINE_RUN_DAY}"
PIPELINE_RUN_START_TIME=$(echo "${PIPELINE_INFO_FILE_NAME}" | awk -F "-" '{print $2}' | awk -F "_" '{print $4}')
PIPELINE_RUN_END_TIME=$(echo "${PIPELINE_INFO_FILE_NAME}" | awk -F "-" '{print $3}')

# Extract the Docker agents used during this pipeline run
DOCKER_AGENT_ID_ONLY_ARRAY=( $(cat "${PIPELINE_INFO_FILE_NAME}" | grep " on Docker Host = " | awk -F " on Docker Host = " '{print $2}') )


# Loop through stored Docker Agent IDs to get full ID plus their variable name
#	Need to get variable name to pull metric info from SemaText
for dockerAgentID in "${DOCKER_AGENT_ID_ONLY_ARRAY[@]}"
do
	DOCKER_AGENT_ID_AND_NAME=$(runSemaTextCurlForDockerAgents docker.cpu.percent all "${PIPELINE_RUN_DATE}" "${PIPELINE_RUN_START_TIME}" "${PIPELINE_RUN_END_TIME}" | grep "${dockerAgentID}" | awk -F "\"" '{print $4}')
	DOCKER_AGENT_ID_AND_NAME_ARRAY+=("${DOCKER_AGENT_ID_AND_NAME}")
done


# Loop through the array of Docker agents IDs and names e.g. 73ad4ebcab2e-furious_pike
for dockerAgentName in "${DOCKER_AGENT_ID_AND_NAME_ARRAY[@]}"
do
	runSemaTextCurlForDockerAgents docker.* "${dockerAgentName}" "${PIPELINE_RUN_DATE}" "${PIPELINE_RUN_START_TIME}" "${PIPELINE_RUN_END_TIME}" > "SemaTextData-${PIPELINE_RUN_DATE}_${PIPELINE_RUN_START_TIME}_${PIPELINE_RUN_END_TIME}-${dockerAgentName}.txt"
	
	# Upload docker agent metrics data file to AWS S3
	aws s3 cp "SemaTextData-${PIPELINE_RUN_DATE}_${PIPELINE_RUN_START_TIME}_${PIPELINE_RUN_END_TIME}-${dockerAgentName}.txt" s3://dockeragentmetrics/"SemaTextData-${PIPELINE_RUN_DATE}_${PIPELINE_RUN_START_TIME}_${PIPELINE_RUN_END_TIME}-${dockerAgentName}.txt"
done

runSemaTextCurlForHost os.* "${PIPELINE_RUN_DATE}" "${PIPELINE_RUN_START_TIME}" "${PIPELINE_RUN_END_TIME}" > "SemaTextData-${PIPELINE_RUN_DATE}_${PIPELINE_RUN_START_TIME}_${PIPELINE_RUN_END_TIME}-Host.txt"

# Upload OS metrics data file to AWS S3
aws s3 cp "SemaTextData-${PIPELINE_RUN_DATE}_${PIPELINE_RUN_START_TIME}_${PIPELINE_RUN_END_TIME}-Host.txt" s3://dockeragentmetrics/"SemaTextData-${PIPELINE_RUN_DATE}_${PIPELINE_RUN_START_TIME}_${PIPELINE_RUN_END_TIME}-Host.txt"

