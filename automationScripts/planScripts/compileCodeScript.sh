#! /bin/bash

ls -al
ls -al conor-git-repo/
ls -al conor-git-repo/softwareProduct/src/main/java/

cd conor-git-repo/softwareProduct/src/main/java/
javac Calculator.java

if [ -f Calculator.class ]
then
	echo "Project Compilation Successful"
else
	echo "PROJECT COMPILATION FAILED!!!"
    exit -1
fi
