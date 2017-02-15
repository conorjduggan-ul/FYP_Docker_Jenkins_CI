### EVERY 1 MIN ### Start a new docker container
#*/1 * * * * /home/docker/gatherContainerCountMetrics/runDockerContainer.sh

### EVERY 5 MINS ### Collect metrics on host OS and container count
#*/5 * * * * /home/docker/gatherContainerCountMetrics/runContainerCountHostMemoryMetricCollection.sh
