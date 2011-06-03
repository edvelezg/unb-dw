#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'pp'
require "yaml"

ofile = File.open("input.csv", "w")

ofile.puts "year||author||book||fname||sentence_num||sentence||place||frequency"

cur_place_id = 1
cur_book_id  = 0

infotbl = File.open("../../GetFiles/Books/infotbl.yaml") { |file| YAML.load(file) }

subtable = []
(infotbl.length-3..infotbl.length-1).each do |i|
  subtable << infotbl[i]
end

subtable.each_index do |idx|

  year   = subtable[idx][3]
  author = subtable[idx][2]
  book   = subtable[idx][1]
  fname  = subtable[idx][0]

  xmlfile = fname.gsub(".txt", ".xml")
  xml     = File.read(xmlfile)
  doc     = Nokogiri::XML(xml)
  sent_id = 0

  # split into sentences first
  sentarr = doc.search('Sentence').map { |e| e }

  sentarr.each_with_index do |sent, sent_num|

    # parsing the emph nodes
    children = sent.search('Location').map { |sent| sent.text }

    # sentence = sent.text.gsub("\n", " ").gsub(/[\n|\s+]+/, " ").chomp.strip
    if children.empty?
      children = ["NULL"]
    end

    sentence = sentarr[sent_num].text.gsub("\n", " ").gsub(/[\n|\s+]+/, " ").chomp.strip

    place_freq = Hash.new(0)
    children.each do |place|
      fixedplace = place.gsub("\n", " ")
      if place == "NULL"
        place_freq[place] = 0
      else
        place_freq[fixedplace] += 1      
      end
    end
    place_freq.each_pair { |place, freq| ofile.puts "#{year}||#{author}||#{book}||#{fname}||#{sent_num}||#{sentence}||#{place}||#{freq}" }
  end

  cur_book_id += 1
end
