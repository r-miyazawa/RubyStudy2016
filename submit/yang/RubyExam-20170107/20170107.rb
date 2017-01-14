i=1
5.times do
	i.times do
		print "*"
	end
	print "\n"
	i=i+1
end

puts "----------------------"

i=1
j=4
5.times do
	j.times do
		print " "
	end
	i.times do
		print "*"
	end
	print "\n"
	i=i+2
	j=j-1
end

puts "----------------------"


i=9
j=0
5.times do
	j.times do
		print " "
	end
	i.times do
		print "*"
	end
	print "\n"
	i=i-2
	j=j+1
end

puts "----------------------"

a = 50
i = 1
begin
	puts a	
	a = a - i
	i = i + 1
end while i<12


puts "----------------------"

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

puts "----------------------"

require 'nokogiri'
require 'open-uri'

url = 'http://info.finance.yahoo.co.jp/fx/detail/?code=USDJPY=FX'
doc = Nokogiri::HTML(open(url))
bid = doc.xpath("//*[@id='USDJPY_detail_bid']").text
ask = doc.xpath("//*[@id='USDJPY_detail_ask']").text
change = doc.xpath("//*[@id='USDJPY_detail_change']").text
puts "Bid(売値):#{bid}"
puts "Ask(買値):#{ask}"
puts "Ask(始値比):#{change}"

puts "----------------------"