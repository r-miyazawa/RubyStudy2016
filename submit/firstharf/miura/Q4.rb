=begin
課題4

1.1個のさいころを振って出た目を返すメソッドdiceを作成せよ

2.10個のさいころを振って出た目の合計値を返すメソッドdice10を作成せよ

3.bmiを求めるメソッドを作成せよ
  bmi : 体重 / (身長(m) * 身長(m)) 

4.素数かどうかを真偽値で返すメソッドを作成せよ
=end

puts '問1'
puts '-------------------------------'

def dice
	rand(6) + 1
end

print '出た目の数は'
print dice
puts 'です'

puts '-------------------------------'


puts '問2'
puts '-------------------------------'

def dice10
	sum = 0
	10.times do 
		sum = sum + dice
	end
	sum
end

print '出た目の数は'
print dice10
puts 'です'
puts '-------------------------------'


puts '問3'
puts '-------------------------------'

def bmi(height, weight)
	weight / (height * height)
end

print '身長184cmで体重68kgの人のBMIは'
print bmi(1.84, 68)
puts 'です'

puts '-------------------------------'


puts '問4'
puts '-------------------------------'

puts '-------------------------------'