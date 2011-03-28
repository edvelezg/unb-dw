#!/usr/bin/env ruby

fname = 'gutenberg.html'

# fix <big><b>s that are sepparated by whitespace
result = File.read(fname).gsub(/<\/b>\s+<\/big>/,  '</b></big>').gsub(/<big>\s+<b>/,  '<big><b>')

# Ignore the header information
needle = 'New releases /'
result = result[result.index(needle)..-1]

# write new gutenberg-1.html file
open("gutenberg-1.html", "w") { |io| io.write(result) }

