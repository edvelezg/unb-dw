#!/usr/bin/env bash

if [ `uname` == "CYGWIN_NT-6.1-WOW64" ]; then
	echo "I can't run here"
else
	../bin/hadoop dfs -rmr output
	../bin/hadoop jar /Users/hadoop/Documents/hadoop-0.20.2/wordcount/lineindexer.jar org.myorg.LineIndexer

	../bin/hadoop dfs -cat output/part-r-00000
fi

