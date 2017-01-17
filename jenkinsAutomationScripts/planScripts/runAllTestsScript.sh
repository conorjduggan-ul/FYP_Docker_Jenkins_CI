#! /bin/bash

echo $USER
export JAVA_HOME=/usr/java/jdk1.8.0_112
cd softwareProduct/

echo -e "Locking Calculator.java while testing it..."

# Use flock to lock Calculator.java exclusively while running command. Fail if it doesn't lock immediately
flock -x -n -E 1 src/main/java/Calculator.java sh -c "./gradlew clean test --info"
