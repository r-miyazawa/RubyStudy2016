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

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts '問1.1)'

a = 1
5.times do
	a.times do
		print "*"
	end
	print "\n"
	a = a + 1
end

puts '問1.2-1)'

a = 1
b = 4
5.times do
	b.times do
		print " "
	end
	a.times do
		print "*"
	end
	print "\n"
	a = a + 2
	b = b - 1
end

puts '問1.2-2)'

a = 9
b = 0
5.times do
	b.times do
		print " "
	end
	a.times do
		print "*"
	end
	print "\n"
	a = a - 2
	b = b + 1
end

puts '問2'

ans = 50
i = 1
puts ans
begin
	ans = ans - i
	puts ans
	i += 1
end while ans > 0

puts '問3'

ary1 = []
ary2 = []
ary3 = []
ary4 = []
tmp = 1

5.times do
	ary1.push(tmp)
	tmp = tmp * 2
end
tmp = 1
5.times do
	ary2.push(tmp)
	tmp = tmp * 3
end
tmp = 1
5.times do
	ary3.push(tmp)
	tmp = tmp * 4
end
tmp = 1
5.times do
	ary4.push(tmp)
	tmp = tmp * 5
end
p ary1
p ary2
p ary3
p ary4

puts '問4'

def num(n)
  return 1 if n == 1
  return 1 if n == 2
  num(n-1) + num(n-2)
end

for i in 1...20
  print "#{num(i)} "
end

puts '問5'

doc = Nokogiri::HTML(open("http://info.finance.yahoo.co.jp/fx/detail/?code=USDJPY=FX",&:read))
doc.xpath('//ul[@class="rateList"]').each do |node|
	p "[Bid]#{node.xpath('//dd[@id="USDJPY_detail_bid"]').text}"
	p "[Ask]#{node.xpath('//dd[@id="USDJPY_detail_ask"]').text}"
	p "[Change]#{node.xpath('//dd[@id="USDJPY_detail_change"]').text}"
end