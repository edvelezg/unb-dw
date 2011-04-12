#!/usr/bin/env bash
curpath=`pwd`
if [ `uname` == "CYGWIN_NT-6.1-WOW64" ]; then
    echo "On Windows"
    winpath=`cygpath -w "$curpath"`
#   echo $winpath
    javac -classpath ../hadoop-0.20.2-core.jar -d classes WordCount.java
    jar -cvf "$winpath/wordcount.jar" -C classes/ .
else
  	echo "On MacOS"
    # echo $curpath
    javac -classpath ../hadoop-0.20.2-core.jar -d classes WordCount.java
    jar -cvf "$curpath/wordcount.jar" -C classes/ .
fi



