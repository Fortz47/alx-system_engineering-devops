#!/usr/bin/env ruby

input = ARGV[0]
pattern = /^h.n$/

result = input.scan(pattern)
if not result.empty?
  puts "#{result[0]}"
end
