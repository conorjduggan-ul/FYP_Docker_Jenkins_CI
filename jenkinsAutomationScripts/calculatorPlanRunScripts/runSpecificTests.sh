###
#       Author: Conor Duggan
#       Email: 13127004@studentmail.ul.ie
#
#       Project Title: FYP Jenkins Automation Script - Run Specifi tests on Calculator code
#
#       Usage: Run script passing in the tests to run
#               e.g. ./runSpecificTests.sh DivisionTest1
###

#! /bin/bash

TESTS_TO_RUN=$1

echo $USER
export JAVA_HOME=/usr/java/jdk1.8.0_112
cd softwareProduct_calculator/

echo -e "Locking Calculator.java while testing it..."

# Use flock to lock Calculator.java exclusively while running command. Fail if it doesn't lock immediately
flock -x -n -E 1 src/main/java/Calculator.java sh -c "./gradlew clean test --info -Dtest.single=${TESTS_TO_RUN} --refresh-dependencies"
