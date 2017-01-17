FROM debian:jessie
MAINTAINER Conor Duggan

RUN useradd -d "/var/jenkins_home" -u 1000 -m -s /bin/bash jenkins
RUN mkdir -p /var/log/conor-jenkins
RUN chown -R jenkins:jenkins /var/log/conor-jenkins

VOLUME ["/var/log/conor-jenkins", "/var/jenkins_home"]

USER jenkins

CMD ["echo", "Jenkins Data Container"]
