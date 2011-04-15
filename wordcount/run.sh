#!/usr/bin/env bash

if [ `uname` == "CYGWIN_NT-6.1-WOW64" ]; then
	echo "I can't run here"
else
	# ../bin/hadoop dfs -rmr output
	# ../bin/hadoop dfs -rmr histos
	../bin/hadoop dfs -rmr mapper3
	../bin/hadoop jar /Users/hadoop/Documents/hadoop-0.20.2/wordcount/wordcount.jar org.myorg.WordCount input output

	../bin/hadoop dfs -cat histos/*
	../bin/hadoop dfs -cat mapper3/*
fi

# 1	2
# 2	2
# 3	2
# 4	5
# 5	2
# file1.txt--1	1
# file1.txt--2	1
# file1.txt--3	1
# file1.txt--4	3
# file1.txt--5	1
# file2.txt--1	1
# file2.txt--2	1
# file2.txt--3	1
# file2.txt--4	2
# file2.txt--5	1