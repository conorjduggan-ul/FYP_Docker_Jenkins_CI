#! /bin/bash

PLAN_NAME="01_Netflix_Servo_Tests"
URL="Pipeline_4_Netflix_Servo/job/${PLAN_NAME}"
PIPELINE_RUN_DATE="Pipeline_4-2017_02_26"
JENKINS_USERNAME="<REDACTED>"
JENKINS_PASSWORD="<REDACTED>"

for num in {4..65}
do
	curl -v -u "${JENKINS_USERNAME}:${JENKINS_PASSWORD} http://192.168.99.100:8080/job/${URL}/${num}/timestamps/?elapsed=HH:mm:ss.S\&appendLog" > conorGetPlanDurationLogFile.txt
	curl -v -u "${JENKINS_USERNAME}:${JENKINS_PASSWORD} http://192.168.99.100:8080/job/${URL}/${num}/timestamps/?time=HH:mm:ss&appendLog" > conorRealTime.txt

	PLAN_RUN_TIME_DATE=$(cat conorRealTime.txt | grep "Started by" | head -n 1 | awk -F" " '{print $1}')

	cat conorGetPlanDurationLogFile.txt > "${PIPELINE_RUN_DATE}_${PLAN_RUN_TIME_DATE}-${PLAN_NAME}-PipelineLogFile.txt"

	aws s3 cp "${PIPELINE_RUN_DATE}_${PLAN_RUN_TIME_DATE}-${PLAN_NAME}-PipelineLogFile.txt" s3://jenkinslogstore/"${PIPELINE_RUN_DATE}_${PLAN_RUN_TIME_DATE}-${PLAN_NAME}-PipelineLogFile.txt"

	rm -rf conorGetPlanDurationLogFile.txt
	rm -rf conorRealTime.txt
	rm -rf "${PIPELINE_RUN_DATE}_${PLAN_RUN_TIME_DATE}-${PLAN_NAME}-PipelineLogFile.txt"
done