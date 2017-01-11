#! /bin/bash

ls -al
ls -al conor-git-repo/
ls -al conor-git-repo/softwareProduct/src/main/java/

echo -e "Locking Calculator.java while compiling it..."
flock -x -w 5 conor-git-repo/softwareProduct/src/main/java/Calculator.java sh -c "javac conor-git-repo/softwareProduct/src/main/java/Calculator.java"

if [ -f Calculator.class ]
then
	echo "Project Compilation Successful"
else
	echo "PROJECT COMPILATION FAILED!!!"
    exit -1
fi
