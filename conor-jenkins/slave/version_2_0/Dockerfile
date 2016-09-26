FROM centos:7.2.1511 
MAINTAINER Conor Duggan

RUN yum update -y && \
         yum clean all

# Install necessary installations
RUN yum install -y git && \
         yum install -y wget && \
         yum install -y openssh-server && \
         yum install -y java-1.8.0-openjdk && \
         yum install -y sudo && \
         yum clean all

# generate ssh keys
RUN /usr/bin/ssh-keygen -A

# Create Jenkins User
RUN useradd jenkins -m -s /bin/bash

RUN mkdir /home/jenkins/.ssh

# Add public key for Jenkins login 
COPY /files/authorized_keys /home/jenkins/.ssh/authorized_keys

# Do permission mods
RUN chown -R jenkins /home/jenkins
RUN chgrp -R jenkins /home/jenkins
RUN chmod 600 /home/jenkins/.ssh/authorized_keys
RUN chmod 700 /home/jenkins/.ssh

# Add the jenkins user to sudoers
RUN echo "jenkins  ALL=(ALL)  ALL" >> etc/sudoers

# Expose port 22 for SSH
EXPOSE 22

# Run SSHD
CMD ["/usr/sbin/sshd","-D"]
