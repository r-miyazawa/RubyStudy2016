
#１問

def dice
	rand(6) + 1
end

puts "出た目の数は#{dice()}"

#２問

def dices10
	sum = 0
	10.times do 
		sum = sum + dice
	end
	sum
end

puts "出た合計数は#{dices10()}"

#３問

def bmi(height, weight)
	weight / (height * height)
end

puts "1.75m,78kgのBMIは #{bmi(1.75, 78)}"

#４問

def prime
	num = rand(100)+1
	count = 0
	(1...num).each do |div|
		if num % div ==0
			count += 1
		end
	end
	unless count>2
		print "素数 " , num , "\n"
	else
		print "素数じゃない " , num , "\n"
	end
end
prime()