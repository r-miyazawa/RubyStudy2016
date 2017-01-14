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

puts '1.1)'

puts "*"
puts "**"
puts "***"
puts "****"
puts "*****"

puts '1.2-1)'

puts "    *"
puts "   ***"
puts "  *****"
puts " *******"
puts "*********"

puts '1.2-2)'

puts "*********"
puts " *******"
puts "  *****"
puts "   ***"
puts "    *"

puts '2.'

counter = 1
num = 50
puts num
begin
	sum = counter += 1
	puts num - sum
	counter += 1
end while counter <= 10

puts '3.'

puts '4.'

puts '5.'