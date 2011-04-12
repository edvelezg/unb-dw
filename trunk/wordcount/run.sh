#!/usr/bin/env bash

../bin/hadoop dfs -rmr output
../bin/hadoop jar /Users/hadoop/Documents/hadoop-0.20.2/wordcount/wordcount.jar org.myorg.WordCount input output

../bin/hadoop dfs -cat output/part-r-00000


