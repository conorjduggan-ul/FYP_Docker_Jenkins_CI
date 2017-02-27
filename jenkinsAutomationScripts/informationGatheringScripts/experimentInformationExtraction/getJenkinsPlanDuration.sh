#! /bin/bash

JENKINS_PIPELNE_TO_CHECK="$1"

for logFile in ${JENKINS_PIPELNE_TO_CHECK}*.txt; do
	echo -e "Extracting duration info from:\n${logFile}"

	PLAN_START_TIME=$(cat "${logFile}" | grep "++ date +%Y_%m_%d_%H:%M:%S" | awk -F" " '{print $1}')
	PLAN_START_TIME_HOUR=$(echo "${PLAN_START_TIME}" | awk -F":" '{print $1}')
	PLAN_START_TIME_MINUTE=$(echo "${PLAN_START_TIME}" | awk -F":" '{print $2}')
	PLAN_START_TIME_SECOND=$(echo "${PLAN_START_TIME}" | awk -F":" '{print $3}' | awk -F"." '{print $1}')
	PLAN_START_TIME_MILLISECOND=$(echo "${PLAN_START_TIME}" | awk -F"." '{print $2}')
	PLAN_START_TOTAL_MILLISECONDS=$(( (${PLAN_START_TIME_HOUR#0}*3600000) + 
		(${PLAN_START_TIME_MINUTE#0}*60000) + 
		(${PLAN_START_TIME_SECOND#0}*1000) + 
		(${PLAN_START_TIME_MILLISECOND#0}) ))
	

	PLAN_END_TIME=$(cat "${logFile}" | grep "Finished: " | awk -F" " '{print $1}')
	PLAN_END_TIME_HOUR=$(echo "${PLAN_END_TIME}" | awk -F":" '{print $1}')
	PLAN_END_TIME_MINUTE=$(echo "${PLAN_END_TIME}" | awk -F":" '{print $2}')
	PLAN_END_TIME_SECOND=$(echo "${PLAN_END_TIME}" | awk -F":" '{print $3}' | awk -F"." '{print $1}')
	PLAN_END_TIME_MILLISECOND=$(echo "${PLAN_END_TIME}" | awk -F"." '{print $2}')
	PLAN_END_TOTAL_MILLISECONDS=$(( (${PLAN_END_TIME_HOUR#0}*3600000) + 
		(${PLAN_END_TIME_MINUTE#0}*60000) + 
		(${PLAN_END_TIME_SECOND#0}*1000) + 
		(${PLAN_END_TIME_MILLISECOND#0}) ))

	PLAN_MILLISECOND_TIME_DIFFERENCE=$(( ${PLAN_END_TOTAL_MILLISECONDS} - ${PLAN_START_TOTAL_MILLISECONDS} ))
	PLAN_DURATION_SECONDS=$(echo "scale=2;${PLAN_MILLISECOND_TIME_DIFFERENCE}/1000" | bc)
	
	echo "Plan git checkout complete time: ${PLAN_START_TIME}"
	echo "Plan end time: ${PLAN_END_TIME}"
	echo -e "Time Difference: ${PLAN_DURATION_SECONDS}\n\n"
done