### EVERY 1 MIN ### Start a new docker container
#*/1 * * * * docker run -i -t conor-jenkins-agent:2.3 /bin/bash

### EVERY 5 MINS ### Collect metrics on host OS and container count
#*/5 * * * * /home/docker/gatherContainerCountMetrics/getContainerCount.sh
#*/5 * * * * /home/docker/gatherContainerCountMetrics/getHostOsMetrics.sh
