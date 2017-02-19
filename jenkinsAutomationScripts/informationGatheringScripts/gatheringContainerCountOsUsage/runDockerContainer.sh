# /bin/bash

FILEPATH=<REDACTED>

for i in 1 2 3 4 5
do
        docker run -d -i -t conor-concurrent-fitnesse:1.0 su - jenkins -c "/home/jenkins/runFitnesseApp.sh" >> "${FILEPATH}concurrentFitnesseRunningContainerIdList.txt"
done