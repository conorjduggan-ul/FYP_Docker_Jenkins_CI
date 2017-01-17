FROM jenkins:2.7.2
MAINTAINER Conor Duggan

# Switch to root user for running the following commands 
USER root

# Create folder to store jenkins logs
RUN mkdir -p /var/log/conor-jenkins
RUN chown -R jenkins:jenkins /var/log/conor-jenkins

# Create folder to move jenkins war file to
# We can then back up /var/jenkins_home without it and save space
RUN mkdir -p /var/cache/conor-jenkins
RUN chown -R jenkins:jenkins /var/cache/conor-jenkins

# Install plugins to use docker slave
COPY files/plugins.txt /plugins.txt       
RUN /usr/local/bin/plugins.sh /plugins.txt

# Copy in the Docker certs, we'll use /usr/local/etc for them
COPY files/ca-key.pem /usr/local/etc/jenkins/certs/ca-key.pem
COPY files/ca.pem /usr/local/etc/jenkins/certs/ca.pem
COPY files/cert.pem /usr/local/etc/jenkins/certs/cert.pem
COPY files/key.pem /usr/local/etc/jenkins/certs/key.pem

# Make sure cert permissions are set correctly
RUN chmod +r /usr/local/etc/jenkins/certs/ca.pem
RUN chmod +r /usr/local/etc/jenkins/certs/cert.pem
RUN chown -R jenkins:jenkins /usr/local/etc/jenkins

# Switch back to jenkins user to be used as default from now on
USER jenkins

# Increase memory pool for jenkins to 8GB e.g. for garbage collection
ENV JAVA_OPTS="-Xmx8192m"

# Tell jenkins where to store its log file and war file
ENV JENKINS_OPTS="--logfile=/var/log/conor-jenkins/jenkins.log  --webroot=/var/cache/conor-jenkins/war"
