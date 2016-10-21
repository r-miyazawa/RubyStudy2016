#問1
#1.1〜100までの整数が昇順に並ぶ配列aを作成せよ
a = Array.new(100){|i| i+1}
p(a)

#2.[1]の配列の各要素を100倍した、新しい配列bを作成せよ
b = a.collect{|i| i*100}
p(b)

#3.[1]の配列の各要素から3の倍数のみ取得した、新しい配列cを作成せよ
c = a.select{|i| i % 3 ==0}
p(c)

#4.[1]の配列を逆順に並び替えせよ
d = a.reverse
p(d)

#5.[1]の配列に含まれる整数の和を求めよ
sum = 0
a.each{|i| sum += i}
p(sum)

#6.数値からなる配列array1と配列array2のそれらのここの要素を足し合わせた結果を配列で返すsum_arrayメソッドを作成せよ
=begin
def sum_array(a1, a2)
	ary = Array.new
	a1.zip(a2) {|a, b| ary << a + b } 
	return ary
end
=end

def sum_array(ary1, ary2)
	return ary1.zip(ary2).collect {|a1,a2| a1+a2} 
end

p(sum_array(a,b))