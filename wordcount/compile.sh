#!/usr/bin/env bash

javac -classpath ../hadoop-0.20.2-core.jar -d classes WordCount.java
jar -cvf /Users/hadoop/Documents/hadoop-0.20.2/wordcount/wordcount.jar -C classes/ .
