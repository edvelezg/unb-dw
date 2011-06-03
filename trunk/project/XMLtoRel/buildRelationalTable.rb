#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'pp'

puts "book;sentence;place;frequency"

cur_place_id = 1
cur_book_id  = 0

files = ['file1.xml', 'file2.xml']
files.each do |file|
  # read html file

  xml = File.read(file)
  doc = Nokogiri::XML(xml)

  # split into sentences first
  sentarr = doc.search('Sentence').map { |e| e }

  sentarr.each_with_index do |sent, i|
    
    # parsing the emph nodes
    children = sent.search('Location').map { |sent| sent.text }

    if children.empty?
      children = ["NONE"]
    else
      children.each do |place|
        puts "#{file};#{place};#{sentarr[i].text};1"
      end
    end
  end
  
  cur_book_id += 1
end