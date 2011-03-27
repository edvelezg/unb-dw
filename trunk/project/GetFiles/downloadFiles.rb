#!/usr/bin/env ruby

os = `uname`.strip
if os == "Darwin"
  $stderr.puts "I'm on a mac, and I will not run here"
  Dir.chdir("Books")
  puts `pwd`
else
  Dir.chdir("Books")
  arr = File.read("files.txt").split("\n")
  arr.each { |e| system("wget #{e}") }
end
