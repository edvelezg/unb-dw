#!/usr/bin/env ruby
require 'rubygems'
require 'whatlanguage'

lst = []
File.foreach("line_counts.txt") { |line| lst << line.split(/\s+/) }

lngs = []
lst.each_with_index do |e, i|
  start = e[0].to_i/2
  if start+10 < e[0].to_i
    
    text = ""
    IO.readlines(e[1])[start..start+10].each do |line| 
      text << line
    end
    language = text.language
    if language.nil?
      lngs << "unknown"
    else
      lngs << language.to_s
    end
  end
end

# lngs.each { |e| puts e }

lst.each_with_index do |e, i|
  lst[i] << lngs[i]
end

File.open("files_langs.txt", "w") do |file|
  lst.each_with_index do |e, i|
    file.puts e.join("\t")
  end 
end


# puts arr[i]

# puts file

# puts "Je suis un homme".language      # => :french
# 
# # OR...
# 
# wl = WhatLanguage.new(:all)
# wl.language("Je suis un homme")  # => :french
# wl.process_text("this is a test of whatlanguage's great language detection features")
# # => {:german=>1, :dutch=>3, :portuguese=>3, :english=>7, :russian=>1, :farsi=>1, :spanish=>3, :french=>2}