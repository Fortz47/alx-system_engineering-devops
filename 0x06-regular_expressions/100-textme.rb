#!/usr/bin/env ruby
_str1 = ARGV[0].scan(/\[from:([^\]]*)/).join
_str2 = ARGV[0].scan(/\[to:([^\]]*)/).join
_str3 = ARGV[0].scan(/\[flags:([^\]]*)/).join

puts _str1.concat(",").concat(_str2).concat(",").concat(_str3)
