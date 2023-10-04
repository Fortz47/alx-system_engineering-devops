#!/usr/bin/env ruby

input = ARGV[0]
pattern = /School/

result = input.scan(pattern)
if not result.empty?
  for i in result
    print "#{i}"
  end
  puts ""
end
