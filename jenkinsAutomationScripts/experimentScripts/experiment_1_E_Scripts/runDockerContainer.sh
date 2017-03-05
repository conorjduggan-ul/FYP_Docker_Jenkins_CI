# /bin/bash

FILEPATH="<REDACTED>"

docker run -d -i -t conor-jenkins-agent:2.3 /bin/bash >> "${FILEPATH}concurrentIdleRunningContainerIdList.txt"
