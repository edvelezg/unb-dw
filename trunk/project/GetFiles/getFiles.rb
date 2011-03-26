#!/usr/bin/env ruby
# links = []
# File.foreach("gutenberg.html") do |line|
#   found = line.scan(/<a href="([\w+:\/.-]*.txt)/)
#   if found.length != 0
#     links << found.flatten
#   end
# end
# 
# puts links.length


require 'rubygems'
require 'nokogiri'

html = File.read("../gutenberg-1.html")

doc = Nokogiri::HTML(html)
arr = doc.search('a').select { |e| e['href'][/\.txt$/] }.map { |e| e['href'] }
arr.each { |e| puts e }

# puts `ssh edvelez@master.licef.ca 'cd unb-dw/project/Books; wget #{arr[0]}'`
# puts "wget #{arr[0]}"
# arr.each { |e| puts e }
# puts doc.search('a').select { |n| n['href'][/\.txt$/] }.map{ |n| n['href'] }
# doc.

