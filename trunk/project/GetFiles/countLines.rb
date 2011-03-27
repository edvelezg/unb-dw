#!/usr/bin/env ruby

arr = `ls Books/*.txt`.split("\n")

puts arr.length

# write lines line counts to a file
arr.each_index do |i|
  system("wc -l #{arr[i]} >> line_counts.txt")  
end
