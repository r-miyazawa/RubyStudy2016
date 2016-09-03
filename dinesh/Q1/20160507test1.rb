def s(max)
arr=(2..max).to_a
(2..Math::sqrt(max)).each do |i|
arr.delete_if {|a|a % i == 0 && a!=i}
end
arr
end

puts s(100)
