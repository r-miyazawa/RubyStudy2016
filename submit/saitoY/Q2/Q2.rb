#1
5.times {
	print "Hello World!\n"
}

#2
(1..9).each{|num1|
	(1..9).each{|num2|
		num = "%02d"%[num1 * num2] + " "
		print num
	}
	print "\n"
}

#3
(1..100).each{|num|
	if num % 3 == 0 && num % 5 ==0 then
		print "Fizz Buzz\n"
	elsif num % 3 == 0 then
		print "Fizz\n"
	elsif num % 5 == 0 then
		print "Buzz\n"
	else
		print "#{num}\n"
	end
}
