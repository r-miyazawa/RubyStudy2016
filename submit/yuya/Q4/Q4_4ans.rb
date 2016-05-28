a = gets.to_i
require 'prime'
[a].each {|e| puts "#{e} #{Prime.prime?(e)}"}