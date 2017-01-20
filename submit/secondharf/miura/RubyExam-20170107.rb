=begin
復習問題
1.以下の出力となるコードを記述せよ
1)
*             
**       
***           
****    
*****     
2-1)
    *    
   ***     
  *****   
 ******* 
*********      
2-2)               
********* 
 *******      
  *****       
   ***    
    *
2.do-whileを使用して以下の出力となるコードを記述せよ
50 49 47 44 40 35 29 22 14 5 -5
3.以下の値を配列に設定し出力するコードを記述せよ。
1 2  4   8  16
1 3  9  27  81
1 4 16  64 256
1 5 25 125 625
4.以下のフィボナッチ数列(20個)の出力となるコードを記述せよ。
1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...
5.以下の為替サイトよりBid(売値)、Ask(買値)、Change(始値比)を取得し出力せよ
http://info.finance.yahoo.co.jp/fx/detail/?code=USDJPY=FX
=end

require 'open-uri'
require 'nokogiri'
require 'openssl'

puts '問1.1)'

a = 1
for i in 1..5 do
	a.times do
		print "*"
	end
	print "\n"
	a += 1
end

puts '問1.2-1'

a = 4
b = 1
for i in 1..5 do
	a.times do
		print " "
	end
	b.times do
		print "*"
	end
	print "\n"
	a -= 1
	b += 2
end

puts '問1.2-2'

a = 0
b = 9

for i in 1..5 do
	a.times do
		print " "
	end
	b.times do
		print "*"
	end
	print "\n"
	b -= 2
	a += 1
end

puts '問2'

num = 50
i = 1
puts num
begin
	num = num - i
	puts num
	i += 1
end while num > 0
print "\n"

puts '問3'

array1 = []
array2 = []
array3 = []
array4 = []

tmp = 1
for i in 1..5 do
	array1.push(tmp)
	tmp = tmp * 2
end

tmp = 1
for j in 1..5 do
	array2.push(tmp)
	tmp = tmp * 3
end

tmp = 1
for k in 1..5 do
	array3.push(tmp)
	tmp = tmp * 4
end

tmp = 1
for l in 1..5 do
	array4.push(tmp)
	tmp = tmp * 5
end
p array1
p array2
p array3
p array4
puts "\n"

puts '問4'

def num(n)
  return 1 if n == 1
  return 1 if n == 2
  num(n-1) + num(n-2)
end

for i in 1...20
  print "#{num(i)} "
end
puts "\n"

puts '問5'

doc = Nokogiri::HTML(open("http://info.finance.yahoo.co.jp/fx/detail/?code=USDJPY=FX",&:read))
doc.xpath('//ul[@class="rateList"]').each do |node|
	p "[Bid]#{node.xpath('//dd[@id="USDJPY_detail_bid"]').text}"
	p "[Ask]#{node.xpath('//dd[@id="USDJPY_detail_ask"]').text}"
	p "[Change]#{node.xpath('//dd[@id="USDJPY_detail_change"]').text}"
end