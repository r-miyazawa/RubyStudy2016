5.times do
	print "Hello World!\n"
end


(1...10).each do |x|
	(1...10).each do |y|
		print x*y, " "
	end
	print "\n"
end

(1...101).each do |i|
	if i % 3 == 0 && i % 5 == 0
		puts "Fizz Buzz\n"
	elsif i % 3 == 0
		puts "Fizz\n"
	elsif i % 5 == 0
		puts "Buzz\n"
	else
		puts i
	end
end
