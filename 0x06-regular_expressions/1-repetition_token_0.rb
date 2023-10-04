#!/usr/bin/env ruby

def match(input, pattern)
  if input =~ pattern
    puts "#{input} is a Match"
  else
    puts "#{input} does NOT Match"
  end
end

input = ARGV[0]
pattern = /hbt{2,}n/

match(input, pattern)
