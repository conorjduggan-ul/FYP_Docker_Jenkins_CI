###
#       Author: Conor Duggan
#       Email: 13127004@studentmail.ul.ie
#
#       Project Title: FYP Jenkins Automation Script - Compile Calculator source code
#
#       Usage: Run script without any arguments
#               e.g. ./compileCodeScript.sh
###

#! /bin/bash

ls -al
ls -al softwareProduct_calculator/src/main/java/

echo -e "Locking Calculator.java while compiling it..."

# Use flock to lock Calculator.java exclusively while running command. Fail if it doesn't lock immediately
flock -x -n -E 1 softwareProduct_calculator/src/main/java/Calculator.java sh -c "javac softwareProduct_calculator/src/main/java/Calculator.java"

if [ -f softwareProduct_calculator/src/main/java/Calculator.class ]
then
	echo "Project Compilation Successful"
else
	echo "PROJECT COMPILATION FAILED!!!"
    exit -1
fi
