#! /bin/bash

# Take in Jenkins, user, password and IP/Port address as arguments
JENKINS_USERNAME=$1
JENKINS_PASSWORD=$2
JENKINS_IP_AND_PORT_GLOBAL_VAR=$3

declare -a planArray=("Pipeline_2/job/01_Compile_Project" 
						"Pipeline_2/job/02_Test_Project_(All_Tests)")

# Loop through stored plan URLs
for planURL in "${planArray[@]}"
do
	echo "Downloading: ${JENKINS_IP_AND_PORT_GLOBAL_VAR}/job/${planURL}/lastSuccessfulBuild/timestamps/?elapsed=HH:mm:ss.S\&appendLog"
	
	# Download log file of last successful Jenkins plan run of planURL
	curl -v -u ${JENKINS_USERNAME}:${JENKINS_PASSWORD} ${JENKINS_IP_AND_PORT_GLOBAL_VAR}/job/${planURL}/lastSuccessfulBuild/timestamps/?elapsed=HH:mm:ss.S\&appendLog > conorGetPlanDurationLogFile.txt

	# Extract the plan name
	PLAN_NAME="$(cat conorGetPlanDurationLogFile.txt | grep "Building remotely on" | awk -F "/home/jenkins/workspace/" '{print $2}')"
	# Extract the plan run duration
	TOTAL_PLAN_DURATION="$(cat conorGetPlanDurationLogFile.txt | grep " Finished: SUCCESS" | awk -F " " '{print $1}')"
	
	echo -e "\n\nInfo for $PLAN_NAME"
	echo -e "TOTAL_PLAN_DURATION: $TOTAL_PLAN_DURATION\n\n"

	rm -rf conorGetPlanDurationLogFile.txt
done
