#!/usr/bin/env ruby

input = ARGV[0]
pattern = /hb?tn/

result = input.scan(pattern)
if not result.empty?
  puts "#{result[0]}"
end
