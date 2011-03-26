#!/usr/bin/env ruby

arr = File.read("files.txt").split("\n")
arr.each { |e| system("wget #{e}") }

