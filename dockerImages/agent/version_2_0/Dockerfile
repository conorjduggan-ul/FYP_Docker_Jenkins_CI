FROM centos:7.2.1511
MAINTAINER Conor Duggan

# Update and Install necessary installations
RUN yum update -y && \
		yum install -y git && \
		yum install -y wget && \
		yum install -y openssh-server && \
		yum install -y sudo && \
		yum clean all

# Download and install jdk
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.rpm 
RUN rpm -Uvh jdk-8u112-linux-x64.rpm

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

# Set JAVA_HOME env variable
ENV JAVA_HOME=/usr/java/jdk1.8.0_60/

# Expose port 22 for SSH
EXPOSE 22

# Run SSHD
CMD ["/usr/sbin/sshd","-D"]