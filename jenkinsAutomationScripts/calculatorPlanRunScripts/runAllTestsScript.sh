###
#       Author: Conor Duggan
#       Email: 13127004@studentmail.ul.ie
#
#       Project Title: FYP Jenkins Automation Script - Run All Tests for Calculator code
#
#       Usage: Run script without any arguments necessry
#               e.g. ./runAllTestsScript.sh
###

#! /bin/bash

echo $USER
export JAVA_HOME=/usr/java/jdk1.8.0_112
cd softwareProduct_calculator/

echo -e "Locking Calculator.java while testing it..."

# Use flock to lock Calculator.java exclusively while running command. Fail if it doesn't lock immediately
flock -x -n -E 1 src/main/java/Calculator.java sh -c "./gradlew clean test --info"
