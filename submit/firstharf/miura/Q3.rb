puts "問1"
puts "---------------------------------------"

# 素数を判定する為のメソッド
def check_prime(num)
	case num
		when 1 then
			false
		when 2 then
			true
		else
			(2..(num-1)).each do |index|
				if num % index == 0
					return false
				end
		end
		return true
	end
end

#1から100までの素数の判定
(1...100).each do |num|
	puts num if check_prime(num)
end

puts "問2"
puts "---------------------------------------"

#判定
def check_leap_year(year)
	return false if year < 4

	year % 400 == 0 || (year % 100 !=0 && year % 4 == 0)
end

#0から2014までの判定
(0...2014).each do |year|
	puts year if check_leap_year(year)
end

puts "問3"
puts "---------------------------------------"