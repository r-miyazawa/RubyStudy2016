#Q1
print "#Q1\n"
5.times do
	print "Hello Woerd!\n"
end

#Q2
print "\n#Q2\n"
tate = 1..9
tate.each{|num1|
	yoko = 1..9
	yoko.each{|num2|
		result = num1 * num2
		if result <= 9
			print 0, result, " "
		else
			print result, " "
		end
	}
	print "\n"
}

#Q3
print "\n#Q3\n"
num = 1

while (num <= 100)
	if (num % 3 == 0) & (num % 5 == 0)
		print "FizzBuzz\n"
	elsif (num % 3 == 0)
	        print "Fizz\n"
	elsif (num % 5 == 0)
	        print "Buzz\n"
	else
		print num, "\n"
	end
	num = num + 1
end
