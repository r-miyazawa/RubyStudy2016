# encoding: utf-8

puts "sam1.1"
a = []
100.times { |i|
  a << i + 1
}
p a
puts "sam1.2"
a = (1..100).to_a
a2 = []
a.each do |i|
  a2 << i * 100
end
p a2

puts "sam1.3"
a = (1..100).to_a
a3 = []
a.each do |i|
  a3 << i if i % 3 == 0
end
p a3

puts "sam1.4"
a = (1..100).to_a
a.reverse!
p a

puts "sam1.5"
a = (1..100).to_a
sum = 0
a.each do |i|
  sum += i
end
puts "sum:#{sum}"


puts "sam1.6"
def sum_array(nums1, nums2)
  result = []
  nums1.zip(nums2) do |a, b|
    result << a + b
  end
  result
end
p sum_array([1, 2, 3], [1, 2, 3])


puts "sam2.1"
str=["stay","foolish","stay","hungry"]
p str

puts "sam2.2"
str_count = str.count-1
 	str_count.times do |i|
 		if str[i] > str[i+1]
			tmp = str[i]
 			str[i] = str[i+1]
 			str[i+1] = tmp
			puts " "
		end
		i += 1
	end
 	p str

puts "sam2.3"

str.count.times do |i|
	str[i] = str[i].capitalize
	end
	p str
	
puts "sam3.1"

wday={:sunday => "“ú—j“ú", 
	:monday => "Œ—j“ú", 
	:tuesday => "‰Î—j“ú", 
	:wednesday => "…—j“ú", 
	:thursday => "–Ø—j“ú",
	 :friday => "‹à—j“ú", 
	 :suturday => "“y—j“ú" } 
p wday[:sunday] #=> "“ú—j“ú"

puts "sam3.2"

puts wday.size #=>7

puts "sam3.3"

wday.each do |key, value|
  puts "uenglish#{key}v->japanes#{value}B"
end