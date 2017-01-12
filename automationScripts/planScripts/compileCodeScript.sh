#! /bin/bash

ls -al
ls -al conor-git-repo/
ls -al conor-git-repo/softwareProduct/src/main/java/

echo -e "Locking Calculator.java while compiling it..."

# Use flock to lock Calculator.java exclusively while running command. Fail if it doesn't lock immediately
flock -x -n -E 1 conor-git-repo/softwareProduct/src/main/java/Calculator.java sh -c "javac conor-git-repo/softwareProduct/src/main/java/Calculator.java"

if [ -f conor-git-repo/softwareProduct/src/main/java/Calculator.class ]
then
	echo "Project Compilation Successful"
else
	echo "PROJECT COMPILATION FAILED!!!"
    exit -1
fi
