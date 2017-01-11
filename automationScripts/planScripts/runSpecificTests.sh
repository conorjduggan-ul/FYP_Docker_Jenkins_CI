#! /bin/bash

TESTS_TO_RUN=$1

echo $USER
export JAVA_HOME=/usr/java/jdk1.8.0_112
cd softwareProduct/

echo -e "Locking Calculator.java while testing it..."

# Use flock to lock Calculator.java exclusively while running command. Wait 5 seconds if cannot initially lock 
flock -x -w 5 src/main/java/Calculator.java sh -c "./gradlew clean test --info -Dtest.single=${TESTS_TO_RUN}"
