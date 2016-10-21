=begin
復習問題

問1.

1.1?100までの整数が昇順に並ぶ配列aを作成せよ

2.[1]の配列の各要素を100倍した、新しい配列bを作成せよ

3.[1]の配列の各要素から3の倍数のみ取得した、新しい配列cを作成せよ

4.[1]の配列を逆順に並び替えせよ

5.[1]の配列に含まれる整数の和を求めよ

6.数値からなる配列array1と配列array2のそれらのここの要素を足し合わせた結果を配列で返すsum_arrayメソッド
　を作成せよ

実行例）
p sum_array([1,2,3],[4,5,6]) # 出力: [5,7,9]


問2.

1."stay foolish stay hungry"という文字列の各単語を要素とする配列を作成せよ

2.[1]の配列をアルファベット順にソートせよ

3.[1]の配列に含まれる文字列を全て単語の先頭を大文字にせよ

問3.

1.曜日を表す英語と日本語の対応を表すハッシュwdayを定義せよ

実行例)
p wday[:sunday] # 出力: "日曜日"

2.[1]のデータ数の7を取得するコードを記載せよ

3.eachメソッドを使用し[1]のハッシュから下記結果を取得せよ

英語[sunday]は日本語で日曜日です。
?(一週間分)

問4.

1.1個のさいころを振って出た目を返すメソッドdiceを作成せよ

2.10個のさいころを振って出た目の合計値を返すメソッドdice10を作成せよ
=end

##問１

a = []
100.times do |i|
    a.push(i+1)
end

p "Array a: #{a}"

b = a.clone
b.collect!{|item|item*100}

p "Array b: #{b}"

c=[]

a.each do |i|
    if i%3==0
	c.push(i)
    end
end

p "Array c: #{c}"

a.reverse!

p "Reverse a: #{a}"

d=0

a.each do |i|
    d = i+d
end

p "Sum: #{d}"

def sum_array(array1,array2)
    sum = []
    if array1.length > array2.length
	array1.length.times do |i|
	    sum.push(array1[i]+array2[i])
	end
    	return sum
    else
	array2.length.times do |i|
	    sum.push(array1[i]+array2[i])
	end
	return sum
    end
end

p "sum: #{sum_array([1,2,3],[4,5,6])}"

##問2

stri = %w(stay foolish stay hungry)

p stri

stri.sort!

p stri

stri.collect!{|item|item.capitalize}

p stri

##問3.

wday = {monday: "月曜日",tuesday: "火曜日",wednesday: "水曜日", 
thursday: "木曜日", friday: "金曜日", saturday: "土曜日", sunday: "日曜日"}

p "sunday: #{wday[:sunday]}"

p "Size #{wday.size}"

wday.each do |a,b|
    p "英語[sunday]は日本語で日曜日です"
end

##問4.

def dice
    p "one dice method number: #{rand(1..6)}"
end

dice

def dice10
    10.times do |i|
       p "dice#{i} method number: #{rand(1..6)}"
    end
end

dice10
