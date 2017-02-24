# /bin/bash

API_KEY="<REDACTED>"
APP_TOKEN="<REDACTED>"
TEST_START_TIME="2017-02-19 19:16:00"
TEST_END_TIME="2017-02-19 19:26:00"
FILEPATH="<REDACTED>"

# Function that runs curl to get Docker agent metrics from SemaText
runSemaTextCurlForDockerAgents() {

	metricToCurl=$1
	containersToCheck=$2

	curl -X POST -k -H "Content-Type: application/json" "https://apps.sematext.com/spm-reports/api/v2/metrics/data" -d "
	{
	  \"apiKey\" : \"${API_KEY}\",
	  \"appToken\" : \"${APP_TOKEN}\",
	  \"metric\" : \"${metricToCurl}\",
	  \"start\" : \"${TEST_START_TIME}\",
	  \"end\" : \"${TEST_END_TIME}\",
	  \"granularity\": \"ONE_MINUTE\",
	  \"filters\" : {
	    \"dockerContainerIdNameFilter\" : {\"values\":[\"${containersToCheck}\"]}
	  }
	}"
}

# Function that runs curl to get OS Host metrics from SemaText
runSemaTextCurlForHost() {

	metricToCurl=$1

	curl -X POST -k -H "Content-Type: application/json" "https://apps.sematext.com/spm-reports/api/v2/metrics/data" -d "
	{
	  \"apiKey\" : \"${API_KEY}\",
	  \"appToken\" : \"${APP_TOKEN}\",
	  \"metric\" : \"${metricToCurl}\",
	  \"start\" : \"${TEST_START_TIME}\",
	  \"end\" : \"${TEST_END_TIME}\",
	  \"granularity\": \"ONE_MINUTE\"
	}"
}

DOCKER_AGENT_LONG_ID_ONLY_ARRAY=( $(cat ${FILEPATH}concurrentFitnesseRunningContainerIdList.txt) )

for dockerAgentID in "${DOCKER_AGENT_LONG_ID_ONLY_ARRAY[@]}"
do
	DOCKER_AGENT_ID_AND_NAME=$(runSemaTextCurlForDockerAgents docker.cpu.percent all | grep "${dockerAgentID:0:12}" | awk -F "\"" '{print $4}')
	DOCKER_AGENT_ID_AND_NAME_ARRAY+=("${DOCKER_AGENT_ID_AND_NAME}")
done

# Loop through the array of Docker agents IDs and names e.g. 73ad4ebcab2e-furious_pike
for dockerAgentName in "${DOCKER_AGENT_ID_AND_NAME_ARRAY[@]}"
do
	# Get all metric info relating to Docker container
	runSemaTextCurlForDockerAgents docker.* "${dockerAgentName}" > "${FILEPATH}SemaTextData-${dockerAgentName}.txt"
done

# Get all metric info for host os machine
runSemaTextCurlForHost os.* > "${FILEPATH}SemaTextData-Host.txt"

