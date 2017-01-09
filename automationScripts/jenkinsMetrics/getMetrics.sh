#! /bin/bash

# Take in Jenkins, user, password and pipeline to check
JENKINS_USERNAME=$1
JENKINS_PASSWORD=$2
JENKINS_PIPELINE_TO_CHECK=$3

if [[ "$JENKINS_PIPELINE_TO_CHECK" == "Pipeline_1" ]]; then
	IFS=$'\n' read -d '' -r -a planArray < pipeline_1_URLs.txt

elif [[ "$JENKINS_PIPELINE_TO_CHECK" == "Pipeline_2" ]]; then
	IFS=$'\n' read -d '' -r -a planArray < pipeline_2_URLs.txt

else
	echo -e "\n\nERROR: No pipeline to check. Killing program\n\n"
	exit
fi

# Loop through stored plan URLs
for planURL in "${planArray[@]}"
do
	echo "Downloading: ${JENKINS_IP_AND_PORT_GLOBAL_VAR}/job/${planURL}/lastSuccessfulBuild/timestamps/?elapsed=HH:mm:ss.S\&appendLog"
	
	# Download log file of last successful Jenkins plan run of planURL
	curl -v -u ${JENKINS_USERNAME}:${JENKINS_PASSWORD} http://192.168.99.101:8080/job/${planURL}/lastSuccessfulBuild/timestamps/?elapsed=HH:mm:ss.S\&appendLog > conorGetPlanDurationLogFile.txt

	# Extract the plan name
	PLAN_NAME="$(cat conorGetPlanDurationLogFile.txt | grep "Building remotely on" | awk -F "/home/jenkins/workspace/" '{print $2}')"
	# Extract the plan run duration
	TOTAL_PLAN_DURATION="$(cat conorGetPlanDurationLogFile.txt | grep " Finished: SUCCESS" | awk -F " " '{print $1}')"
	
	echo -e "\n\nInfo for $PLAN_NAME"
	echo -e "TOTAL_PLAN_DURATION: $TOTAL_PLAN_DURATION\n\n"

	rm -rf conorGetPlanDurationLogFile.txt
done
