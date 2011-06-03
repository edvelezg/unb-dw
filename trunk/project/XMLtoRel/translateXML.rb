#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'pp'

cur_place_id = 1
cur_book_id  = 0
tbl_places   = {"NONE" => 0}
files        = ['file1.xml', 'file2.xml']

sfile  = File.open("sentences.txt", "w")
spfile = File.open("sentences_and_places.txt", "w")

files.each do |file|
  # read html file

  xml = File.read(file)
  doc = Nokogiri::XML(xml)

  # split into sentences first
  arr = doc.search('Sentence').map { |e| e }

  tbl_sentences            = []
  tbl_sentences_and_places = []

  arr.each_with_index do |e, i|

    # puts e.content.gsub("\n", " ").gsub("\t+", " ").gsub("\s+", " ")
    tbl_sentences << [cur_book_id, i , e.content.gsub("\n", " ")]

    # parsing the emph nodes
    children = e.search('Location').map { |e| e.text }

    if children.empty?
      children = ["NONE"]
    end

    children.each do |e|
      val = tbl_places[e]
      if val.nil?
        tbl_places[e] ||= cur_place_id
        tbl_sentences_and_places << [cur_book_id, i, cur_place_id, 1]
        cur_place_id += 1
      else
        tbl_sentences_and_places << [cur_book_id, i, tbl_places[e], 1]
      end
    end

  end

  # Sentence table
  tbl_sentences.each { |e| sfile.puts e.join("\t") }

  # Sentence table and places
  tbl_sentences_and_places.each { |e| spfile.puts e.join("\t") }
  
  cur_book_id += 1
end

puts "place\tplace_id"
File.open("places.txt", "w") do |file|
  tbl_places.each { |e| file.puts "#{e[1]}\t#{e[0]}" }  
end

