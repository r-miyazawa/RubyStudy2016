puts "問1"
a = Array.new
i=1
1..100.times do
	a.push(i)
	i+=1
end
p a

puts "問2"
b = Array.new
b = a.clone
b.collect! {|item| item * 100}
p b

puts "問3"
c = Array.new
a.each {|val|
	if val%3 == 0
		c.push(val)
	end
}
p c

puts "問4"
d = Array.new
d = a.clone
i=0
50.times do
	tmp = 0
	tmp = d[i]
	d[i] = d[d.count-i-1]
	d[d.count-i-1] = tmp
	i += 1
end
p d

puts "問5"
sum = 0
i = 0
50.times do
	sum += a[i]
	i += 1
end
puts "aの配列の合計は#{sum}"

# 問1と問3の配列を使用
puts "問6"
def sum_array(array1, array2)
	sum_array = []
	max = array1.count
	i = j = 0

	if array1.count < array2.count
		max = array2.count
	end
	
	max.times do
		sum_array[i] = array1[j] + array2[j]
		i += 1
		j += 1
	end

	return sum_array
end

sum_array = sum_array(a, b)
p sum_array



