5.times do
	print  "Hello World\n"
end



a=(1...10)
b=(1...10)

a.each do |n|
 	b.each do |m|
 		printf("%02d ", n*m)
 	end
 	print "\n"
 end

	i=0
	while (i<=100)
	if i % 3 == 0 && i % 5 == 0
 		puts "Fizz Buzz\n"
	elsif i % 3 == 0
		puts "Fizz\n"
	elsif i % 5 == 0
		puts "Buzz\n"
	else
		puts i
	end
	i=i+1
end
