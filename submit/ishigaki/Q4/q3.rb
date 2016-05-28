def bmi(w, h)
	return w / (h * h)
end
STDOUT.sync = true

puts "体重の入力"
weight = gets.to_f
puts "身長の入力"
height = gets.to_f
height = height/100
print "bmi:"
print bmi(weight, height)