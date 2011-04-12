#!/usr/bin/env bash

../bin/hadoop dfs -rm input/file1.txt
../bin/hadoop dfs -rm input/file2.txt

../bin/hadoop dfs -rmr output

../bin/hadoop dfs -copyFromLocal /Users/hadoop/Documents/hadoop-0.20.2/wordcount/input/file1.txt input
../bin/hadoop dfs -copyFromLocal /Users/hadoop/Documents/hadoop-0.20.2/wordcount/input/file2.txt input

../bin/hadoop dfs -cat input/file1.txt
../bin/hadoop dfs -cat input/file2.txt


# ../bin/hadoop dfs -ls 

# ../bin/hadoop jar /Users/hadoop/Documents/hadoop-0.20.2/wordcount/wordcount.jar org.myorg.WordCount input output

