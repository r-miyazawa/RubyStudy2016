#問4.

#1.1個のさいころを振って出た目を返すメソッドdiceを作成せよ
def dice()
	return rand(1..6)
end

p dice()

#2.10個のさいころを振って出た目の合計値を返すメソッドdice10を作成せよ
def dice10()
	sum = 0
	10.times{
		sum += dice
	}
	return sum
end

p dice10()
