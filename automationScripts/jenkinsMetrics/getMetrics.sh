#! /bin/bash

# Take in Jenkins, user, password and IP/Port address as arguments
JENKINS_USERNAME=$1
JENKINS_PASSWORD=$2
JENKINS_IP_AND_PORT_GLOBAL_VAR=$3

declare -a planArray=("Pipeline_2/job/01_Compile_Project" 
						"Pipeline_2/job/02_Test_Project_\(All_Tests\)")

# Loop through stored plan URLs
for planURL in "${planArray[@]}"
do
	echo "${JENKINS_IP_AND_PORT_GLOBAL_VAR}/job/${planURL}/lastSuccessfulBuild/timestamps/?elapsed=HH:mm:ss.S\&appendLog"
	# Download log file of last successful Jenkins plan run
	curl -v -u ${JENKINS_USERNAME}:${JENKINS_PASSWORD} ${JENKINS_IP_AND_PORT_GLOBAL_VAR}/job/${planURL}/lastSuccessfulBuild/timestamps/?elapsed=HH:mm:ss.S\&appendLog > conorTestLogFile.txt

	PLAN_NAME="$(cat conorTestLogFile.txt | grep "Building remotely on" | awk -F "/home/jenkins/workspace/" '{print $2}')"
	TOTAL_PLAN_DURATION="$(cat conorTestLogFile.txt | grep " Finished: SUCCESS" | awk -F " " '{print $1}')"
	echo -e "\n\nInfo for $PLAN_NAME"
	echo -e "TOTAL_PLAN_DURATION: $TOTAL_PLAN_DURATION\n\n"

	rm -rf conorTestLogFile.txt
done
