###
#       Author: Conor Duggan
#       Email: 13127004@studentmail.ul.ie
#
#       Project Title: FYP Jenkins Automation Script
#
#       Usage: Run script passing in jenkins username, password and the pipeline to gather info on. 
#               e.g. ./extractPlanData.sh <jenkins:username> <jenkins:password> Pipeline_1
###

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

elif [[ "$JENKINS_PIPELINE_TO_CHECK" == "Pipeline_4" ]]; then
        IFS=$'\n' read -d '' -r -a planArray < pipeline_4_URLs.txt

else
        echo -e "\n\nERROR: No pipeline to check. Killing program\n\n"
        exit
fi

echo "Downloading: http://192.168.99.101:8080job/${planArray[0]}/lastSuccessfulBuild/timestamps/?time=HH:mm:ss&appendLog"

PLAN_NAME=$(echo ${planArray[0]} | awk -F "/" '{print $3}')

# Download log file of last successful Jenkins plan run of planArray[0]
curl -v -u ${JENKINS_USERNAME}:${JENKINS_PASSWORD} "http://192.168.99.101:8080/job/${planArray[0]}/lastSuccessfulBuild/timestamps/?time=HH:mm:ss&appendLog" > conorGetPlanDurationLogFile.txt

PIPELINE_STARTING_TIME=$(cat conorGetPlanDurationLogFile.txt | grep "  Started by user Conor Duggan" | awk -F " " '{print $1}')
# Extract plan run time and date
PLAN_RUN_TIME_DATE="$(cat conorGetPlanDurationLogFile.txt | grep "Plan starting time is:" | head -1 | awk -F "is:" '{print $2}' | awk -F "'" '{print $1}')"

# Loop through stored plan URLs
for planURL in "${planArray[@]}"
do
        # Download plan log with timestamp
        curl -v -u ${JENKINS_USERNAME}:${JENKINS_PASSWORD} "http://192.168.99.101:8080/job/${planURL}/lastSuccessfulBuild/timestamps/?time=HH:mm:ss&appendLog" > conorGetPlanDurationLogFile.txt

        # Find the time that the plan ended
        PIPELINE_END_TIME=$(cat conorGetPlanDurationLogFile.txt | grep "  Finished: SUCCESS" | awk -F " " '{print $1}')

        # Download the jenkins info from the API
        curl -v -u ${JENKINS_USERNAME}:${JENKINS_PASSWORD} "http://192.168.99.101:8080/job/${planURL}/lastSuccessfulBuild/api/json?pretty=true" > conorGetPlanDurationLogFile.txt

        # Extract the time it took the plan to run
        PLAN_DURATION_TIME=$(cat conorGetPlanDurationLogFile.txt | grep "  \"duration\" : " | awk -F ": " '{print $2}' | awk -F "," '{print $1}')
        PLAN_DURATION_TIME=$(awk "BEGIN {print (${PLAN_DURATION_TIME}/1000)/60}")

        # Extract the Docker Agent ID that hosted the jenkins plan run
        DOCKER_AGENT_ID=$(cat conorGetPlanDurationLogFile.txt | grep "  \"builtOn\" : \"Docker Host-" | awk -F "Host-" '{print $2}' | awk -F "\"" '{print $1}')     

        # Keep adding each plan time for the pipeline together to find the total plan duration time for the pipeline
        TOTAL_PIPELINE_PLAN_TIME=$(awk "BEGIN {print $TOTAL_PIPELINE_PLAN_TIME + $PLAN_DURATION_TIME; exit}")

        # Write the duration for the planURL to temp file to be added to final file
        echo -e "Plan: ${planURL} duration = ${PLAN_DURATION_TIME} mins on Docker Host = ${DOCKER_AGENT_ID}" >> tempPlanDurationTime.txt
done

# Write total duration time for pipeline plans to temp file
echo -e "Total Pipeline Duration = ${TOTAL_PIPELINE_PLAN_TIME} mins" >> tempPlanDurationTime.txt

# Write pipelines start and end times to final txt file
echo -e "${JENKINS_PIPELINE_TO_CHECK} STARTING TIME IS: ${PIPELINE_STARTING_TIME}\n${JENKINS_PIPELINE_TO_CHECK} END TIME IS: ${PIPELINE_END_TIME}" > "${JENKINS_PIPELINE_TO_CHECK}-${PLAN_RUN_TIME_DATE}-${PIPELINE_END_TIME}-Execution_Time.txt"

# Write the plan timing info stored in temp file for the plans in pipeline to the final final
cat tempPlanDurationTime.txt >> "${JENKINS_PIPELINE_TO_CHECK}-${PLAN_RUN_TIME_DATE}-${PIPELINE_END_TIME}-Execution_Time.txt"

rm -rf tempPlanDurationTime.txt
rm -rf conorGetPlanDurationLogFile.txt

# Upload log file to AWS S3
aws s3 cp "${JENKINS_PIPELINE_TO_CHECK}-${PLAN_RUN_TIME_DATE}-${PIPELINE_END_TIME}-Execution_Time.txt" s3://jenkinspipelineduration/"${JENKINS_PIPELINE_TO_CHECK}-${PLAN_RUN_TIME_DATE}-${PIPELINE_END_TIME}-Execution_Time.txt"
