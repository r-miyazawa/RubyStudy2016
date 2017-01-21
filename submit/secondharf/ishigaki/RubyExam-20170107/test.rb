require 'open-uri'
require 'nokogiri'
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "問1"
i=1
5.times do
	i.times do
		print "*"
	end
	print "\n"
	i=i+1
end

puts "問2-1"
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

puts "問2-2"
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

puts "問2"

ans = 50
i = 1
begin
	ans = ans - i
	puts ans
	i = i + 1
end while ans > 0

puts "問3"
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

puts "問4"

doc = Nokogiri::HTML(open("http://info.finance.yahoo.co.jp/fx/detail/?code=USDJPY=FX",&:read))
doc.xpath('//ul[@class="rateList"]').each do |node|
	p "[Bid]#{node.xpath('//dd[@id="USDJPY_detail_bid"]').text}"
	p "[Ask]#{node.xpath('//dd[@id="USDJPY_detail_ask"]').text}"
	p "[Change]#{node.xpath('//dd[@id="USDJPY_detail_change"]').text}"
end


