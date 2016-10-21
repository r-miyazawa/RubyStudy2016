def dice
	return rand(1..6)
end
def dice10
	ans = 0
	10.times do
		ans += dice
	end
	return ans
end

puts "問1"
puts "出た目は#{dice}です"

puts "問2"
puts "結果は#{dice10}です"