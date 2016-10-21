puts "問1"
str = ["stay", "foolish", "stay", "hungry"]
p str

puts "問2"
s_count = str.count-1
s_count.times do
	s_count.times do |i|
		if str[i] > str[i+1]
			tmp = str[i]
			str[i] = str[i+1]
			str[i+1] = tmp
			puts "in"
		end
		i += 1
	end
end
p str

puts "問3"
str.count.times do |i|
	str[i] = str[i].capitalize
end
p str