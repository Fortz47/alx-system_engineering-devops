#!/usr/bin/env ruby

input = ARGV[0]
pattern = /[A-Z]/

result = input.scan(pattern)
if not result.empty?
  puts "#{result.join}"
end
