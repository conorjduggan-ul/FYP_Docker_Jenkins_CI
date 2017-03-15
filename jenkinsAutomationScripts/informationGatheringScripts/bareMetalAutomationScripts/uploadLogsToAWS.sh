###
#       Author: Conor Duggan
#       Email: 13127004@studentmail.ul.ie
#
#       Project Title: FYP Jenkins Automation Script
#
#       Usage: Run script passing in jenkins username, password and the pipeline to gather info on. 
#               e.g. ./uploadLogsToAWS.sh <jenkins:username> <jenkins:password> Pipeline_1
###

#! /bin/bash

# Take in Jenkins, user, password and pipeline to check
JENKINS_USERNAME=$1
JENKINS_PASSWORD=$2
JENKINS_PIPELINE_TO_CHECK=$3

if [ "$JENKINS_PIPELINE_TO_CHECK" = "Pipeline_1" ]; then
	IFS=$'\n' read -d '' -r -a planArray < pipeline_1_URLs.txt

elif [ "$JENKINS_PIPELINE_TO_CHECK" = "Pipeline_2" ]; then
	#IFS=$'\n' read -d '' -r -a planArray < pipeline_2_URLs.txt
	planArray[0]='Pipeline_2_Calculator_Combined_Tests/job/01_Compile_Project'
	planArray[1]='Pipeline_2_Calculator_Combined_Tests/job/02_Test_Project_(All_Tests)'

elif [ "$JENKINS_PIPELINE_TO_CHECK" = "Pipeline_3" ]; then
	IFS=$'\n' read -d '' -r -a planArray < pipeline_3_URLs.txt

elif [ "$JENKINS_PIPELINE_TO_CHECK" = "Pipeline_4" ]; then
	IFS=$'\n' read -d '' -r -a planArray < pipeline_4_URLs.txt

else
	echo -e "\n\nERROR: No pipeline to check. Killing program\n\n "
	exit
fi

# Loop through stored plan URLs
for planURL in "${planArray[@]}"
do
	echo "Downloading: http://0.0.0.0:8080/job/${planURL}/lastSuccessfulBuild/timestamps/?elapsed=HH:mm:ss.S\&appendLog"
	
	PLAN_NAME=$(echo ${planURL} | awk -F "/" '{print $3}')

	# Download log file of last successful Jenkins plan run of planURL
	curl -v -u ${JENKINS_USERNAME}:${JENKINS_PASSWORD} http://0.0.0.0:8080/job/${planURL}/lastSuccessfulBuild/timestamps/?elapsed=HH:mm:ss.S\&appendLog > conorGetPlanDurationLogFile.txt

	# Extract plan run time and date
	PLAN_RUN_TIME_DATE="$(cat conorGetPlanDurationLogFile.txt | grep "Plan starting time is:" | head -1 | awk -F "is:" '{print $2}' | awk -F "'" '{print $1}')"
	# Extract the plan run duration
	TOTAL_PLAN_DURATION="$(cat conorGetPlanDurationLogFile.txt | grep " Finished: SUCCESS" | awk -F " " '{print $1}')"
	
	echo -e "\n\nInfo for: $planURL"
	echo -e "TOTAL_PLAN_DURATION: $TOTAL_PLAN_DURATION\n\n"

	# Save the log files
	cat conorGetPlanDurationLogFile.txt > "${JENKINS_PIPELINE_TO_CHECK}-${PLAN_RUN_TIME_DATE}-${PLAN_NAME}-PipelineLogFile.txt"
	
	# Upload log file to AWS S3
	aws s3 cp "${JENKINS_PIPELINE_TO_CHECK}-${PLAN_RUN_TIME_DATE}-${PLAN_NAME}-PipelineLogFile.txt" s3://jenkinslogstore/"${JENKINS_PIPELINE_TO_CHECK}-${PLAN_RUN_TIME_DATE}-${PLAN_NAME}-PipelineLogFile.txt"
	
	rm -rf conorGetPlanDurationLogFile.txt
done
