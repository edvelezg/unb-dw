#!/usr/bin/env bash

if [ `uname` == "CYGWIN_NT-6.1-WOW64" ]; then
	echo "I can't run here"
else
	# ../bin/hadoop dfs -rmr output
	# ../bin/hadoop dfs -rmr histos
	# ../bin/hadoop dfs -rmr mapper3
	# ../bin/hadoop dfs -rmr mapper4
	../bin/hadoop dfs -rmr mapper5

	../bin/hadoop jar /Users/hadoop/Documents/hadoop-0.20.2/wordcount/wordcount.jar org.myorg.WordCount input output

	../bin/hadoop dfs -cat output/*
	../bin/hadoop dfs -cat histos/*
	../bin/hadoop dfs -cat mapper3/*
	../bin/hadoop dfs -cat mapper4/*	
	../bin/hadoop dfs -cat mapper5/*	
fi
