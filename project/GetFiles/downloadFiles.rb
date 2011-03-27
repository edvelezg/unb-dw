#!/usr/bin/env ruby

os = `uname`.strip
if os == "Darwin"
  puts "I'm on a mac, and I will not run here"
else
  arr = File.read("files.txt").split("\n")
  arr.each { |e| system("wget #{e}") }
end
