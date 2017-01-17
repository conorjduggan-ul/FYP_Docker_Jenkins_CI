#! /bin/bash

# Take in Jenkins, user, password and pipeline to check
JENKINS_USERNAME=$1
JENKINS_PASSWORD=$2
JENKINS_PIPELINE_TO_CHECK=$3

if [[ "$JENKINS_PIPELINE_TO_CHECK" == "Pipeline_1" ]]; then
	IFS=$'\n' read -d '' -r -a planArray < pipeline_1_URLs.txt

elif [[ "$JENKINS_PIPELINE_TO_CHECK" == "Pipeline_2" ]]; then
	IFS=$'\n' read -d '' -r -a planArray < pipeline_2_URLs.txt

elif [[ "$JENKINS_PIPELINE_TO_CHECK" == "Pipeline_3" ]]; then
	IFS=$'\n' read -d '' -r -a planArray < pipeline_3_URLs.txt

else
	echo -e "\n\nERROR: No pipeline to check. Killing program\n\n"
	exit
fi

echo "Downloading: http://192.168.99.100:8080job/${planArray[0]}/lastSuccessfulBuild/timestamps/?time=HH:mm:ss&appendLog"
	
PLAN_NAME=$(echo ${planArray[0]} | awk -F "/" '{print $3}')

# Download log file of last successful Jenkins plan run of planArray[0]
curl -v -u ${JENKINS_USERNAME}:${JENKINS_PASSWORD} "http://192.168.99.100:8080/job/${planArray[0]}/lastSuccessfulBuild/timestamps/?time=HH:mm:ss&appendLog" > conorGetPlanDurationLogFile.txt

PIPELINE_STARTING_TIME=$(cat conorGetPlanDurationLogFile.txt | grep "  Started by user Conor Duggan" | awk -F " " '{print $1}')
# Extract plan run time and date
PLAN_RUN_TIME_DATE="$(cat conorGetPlanDurationLogFile.txt | grep "Plan starting time is:" | head -1 | awk -F "is:" '{print $2}' | awk -F "'" '{print $1}')"
	
# Loop through stored plan URLs
for planURL in "${planArray[@]}"
do
	curl -v -u ${JENKINS_USERNAME}:${JENKINS_PASSWORD} "http://192.168.99.100:8080/job/${planURL}/lastSuccessfulBuild/timestamps/?time=HH:mm:ss&appendLog" > conorGetPlanDurationLogFile.txt

	PIPELINE_END_TIME=$(cat conorGetPlanDurationLogFile.txt | grep "  Finished: SUCCESS" | awk -F " " '{print $1}')
done

echo -e "${JENKINS_PIPELINE_TO_CHECK} STARTING TIME IS: ${PIPELINE_STARTING_TIME}\n${JENKINS_PIPELINE_TO_CHECK} END TIME IS: ${PIPELINE_END_TIME}" > "${JENKINS_PIPELINE_TO_CHECK}-${PLAN_RUN_TIME_DATE}-${PIPELINE_END_TIME}-Execution_Time.txt"

# Upload log file to AWS S3
aws s3 cp "${JENKINS_PIPELINE_TO_CHECK}-${PLAN_RUN_TIME_DATE}-${PIPELINE_END_TIME}-Execution_Time.txt" s3://jenkinspipelineduration/"${JENKINS_PIPELINE_TO_CHECK}-${PLAN_RUN_TIME_DATE}-${PIPELINE_END_TIME}-Execution_Time.txt"