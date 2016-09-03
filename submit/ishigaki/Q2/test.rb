5.times do
	puts "Hello World!"
end

print("-----------\n")

num = [1, 2, 3, 4, 5, 6, 7, 8, 9]
num.each{|count1|
	num.each{|count2|
		print(format('%02d ', count1 * count2))
	}
	print("\n")
}

print("-----------\n")

i = 1
while i <= 100 do
	print "#{i}："
	if (i % 3) == 0 && (i % 5) == 0
		print("Fizz Buzz")
	elsif i % 5 == 0
		print("Buzz")
	elsif i % 3 == 0
		print("Fizz")
	end
	i += 1
	print("\n")
end