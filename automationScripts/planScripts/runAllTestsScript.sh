#! /bin/bash

echo $USER
export JAVA_HOME=/usr/java/jdk1.8.0_112
cd softwareProduct/
./gradlew clean test --info
