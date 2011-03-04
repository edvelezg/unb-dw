#!/usr/bin/env ruby
def getOccupations(authors)
  count = 1
  # getDates(authors)
  authors.each do |e|
    info = ""
    arr = e.split("(")# .each_index { |i| info << e[i] if i > 0 }
    arr.each_index { |i| info << arr[i] if i > 0 }
    # puts info

    if count > 100
      break
    end

    found = info.scan(/\[([^\]\[\n]+)\]/)
    p found
    count += 1
    if found.length < 1
      # puts e
      # puts info
      # p found
    end
  end  
end

def getDates(authors)
  count = 1
  authors.each do |e|
    # puts e.split("(")[1]
    # years
    if count > 100
      break
    end

    found = e.scan(/\([ca.\s]*(\d+)-(\d+[B|C.\s]*)[\/\d+]*\)/)
    # print "#{count}"
    p found
    if found.length > 1 || found.length <  1
      puts e
    end

    # p arr
    count+=1
  end
end

authors = []
myarr   = []
flag    = 0
File.foreach("gutenberg.html") do |line|
  if line.scan("<big><b>").length > 0
    flag = 1
  end
  
  if flag == 1
    myarr << line.chomp
  end
    
  if line.scan("</b></big>").length > 0
    authors << myarr.join(" ").gsub("</b></big>", "").gsub("<big><b>", "")
    myarr = []
    flag = 0
  end
end

getDates(authors)
