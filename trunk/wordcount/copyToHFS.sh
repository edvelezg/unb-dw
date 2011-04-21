#!/usr/bin/env bash

function getAndCopy () {
	wget $1
	mv "$(basename $1)" "$2"
}

# getAndCopy "http://www.gutenberg.ca/ebooks/alloway-crossedswords/alloway-crossedswords-00-t.txt"               "input/file0.data"
# getAndCopy "http://www.gutenberg.ca/ebooks/murraywhh-storythekegtold/murraywhh-storythekegtold-00-t.txt"       "input/file1.data"
# getAndCopy "http://www.gutenberg.ca/ebooks/service-pretender/service-pretender-00-t.txt"                       "input/file2.data"
# getAndCopy "http://www.gutenberg.ca/ebooks/salec-specialist/salec-specialist-00-t.txt"                         "input/file3.data"
# getAndCopy "http://www.gutenberg.ca/ebooks/hofland-affectionatebrothers/hofland-affectionatebrothers-00-t.txt" "input/file4.data"

cd input
    #sed -n '500,510p' < file0.data > file0.txt
    #sed -n '500,510p' < file1.data > file1.txt
    #sed -n '500,510p' < file2.data > file2.txt
    #sed -n '100,110p' < file3.data > file3.txt
    #sed -n '500,510p' < file4.data > file4.txt
    
    cp file0.data file0.txt
    cp file1.data file1.txt
    cp file2.data file2.txt
    cp file3.data file3.txt
    cp file4.data file4.txt
cd -

../bin/hadoop dfs -rm input/file0.txt
../bin/hadoop dfs -rm input/file1.txt
../bin/hadoop dfs -rm input/file2.txt
../bin/hadoop dfs -rm input/file3.txt
../bin/hadoop dfs -rm input/file4.txt

../bin/hadoop dfs -rmr output

../bin/hadoop dfs -copyFromLocal /Users/hadoop/Documents/hadoop-0.20.2/wordcount/input/file0.txt input
../bin/hadoop dfs -copyFromLocal /Users/hadoop/Documents/hadoop-0.20.2/wordcount/input/file1.txt input
../bin/hadoop dfs -copyFromLocal /Users/hadoop/Documents/hadoop-0.20.2/wordcount/input/file2.txt input
../bin/hadoop dfs -copyFromLocal /Users/hadoop/Documents/hadoop-0.20.2/wordcount/input/file3.txt input
../bin/hadoop dfs -copyFromLocal /Users/hadoop/Documents/hadoop-0.20.2/wordcount/input/file4.txt input

# ../bin/hadoop dfs -cat input/file0.txt
# ../bin/hadoop dfs -cat input/file1.txt
# ../bin/hadoop dfs -cat input/file2.txt
# ../bin/hadoop dfs -cat input/file3.txt
# ../bin/hadoop dfs -cat input/file4.txt


# ../bin/hadoop dfs -ls 

# ../bin/hadoop jar /Users/hadoop/Documents/hadoop-0.20.2/wordcount/wordcount.jar org.myorg.WordCount input output

