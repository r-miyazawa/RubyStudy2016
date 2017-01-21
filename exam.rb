require 'open-uri'
require 'nokogiri'
require 'openssl'

puts 'problem1.1)'

a = 1
for i in 1..5 do
	a.times do
		print "*"
	end
	print "\n"
	a += 1
end

puts 'problem1.2-1'

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

puts 'problem1.2-2'

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

puts 'problem2'

num = 50
i = 1
puts num
begin
	num = num - i
	puts num
	i += 1
end while num > 0
print "\n"

puts 'problem3'

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

puts 'problem4'

def num(n)
  return 1 if n == 1
  return 1 if n == 2
  num(n-1) + num(n-2)
end

for i in 1...20
  print "#{num(i)} "
end
puts "\n"

puts 'problem5'

doc = Nokogiri::HTML(open("http://info.finance.yahoo.co.jp/fx/detail/?code=USDJPY=FX",&:read))
doc.xpath('//ul[@class="rateList"]').each do |node|
	p "[Bid]#{node.xpath('//dd[@id="USDJPY_detail_bid"]').text}"
	p "[Ask]#{node.xpath('//dd[@id="USDJPY_detail_ask"]').text}"
	p "[Change]#{node.xpath('//dd[@id="USDJPY_detail_change"]').text}"
endrequire 'anemone'

Anemone.crawl("https://tech-c2016.github.io/sample/hierarchy/main.html") do |anemone|



  anemone.on_every_page do |page|
  
      p page.url
  end
