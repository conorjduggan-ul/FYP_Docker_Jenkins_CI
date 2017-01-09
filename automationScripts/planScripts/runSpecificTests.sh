#! /bin/bash

TESTS_TO_RUN=$1

echo $USER
export JAVA_HOME=/usr/java/jdk1.8.0_112
cd softwareProduct/
./gradlew clean test --info -Dtest.single=${TESTS_TO_RUN}
