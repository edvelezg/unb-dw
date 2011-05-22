#!/usr/bin/env ruby

File.foreach("files.txt") do |line|
  filename = line.split("\/").last.chomp
  system("wc -l Books/#{filename} >> line_counts.txt")
end

