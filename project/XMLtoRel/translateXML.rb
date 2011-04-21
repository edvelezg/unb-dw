#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'pp'

# read html file
xml = File.read('sample.xml')
doc = Nokogiri::XML(xml)

# split into sentences first
arr = doc.search('Sentence').map { |e| e }

count       = 1
tbl_places    = {"NONE" => 0}
tbl_sentences    = []
tbl_sentences_and_places = []

arr.each_with_index do |e, i|
  
  tbl_sentences << [i , e.content]
  
  # parsing the emph nodes
  children = e.search('Location').map { |e| e.text }

  if children.empty?
    children = ["NONE"]
  end
  
  children.each do |e|
    val = tbl_places[e]
    if val.nil?
      tbl_places[e] ||= count
      tbl_sentences_and_places << [i, count, e]
      count += 1
    else
      tbl_sentences_and_places << [i, tbl_places[e], e]
    end
  end
  
end

puts "sentence table"
# tbl_sentences.each { |e| puts e.join("\t") }
puts
puts "sentence and places table"
# tbl_sentences_and_places.each { |e| puts e.join("\t") }
puts
puts "places table"
tbl_places.each { |e| puts e.join("\t") }