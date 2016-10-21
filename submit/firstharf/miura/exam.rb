#問1
a = Array.new
100.times{|n|
	a << n + 1
}
print "問1の1:",a,"\n"

b = a.collect{|n| n * 100}
print "問1の2:",b,"\n"

c = a.reject{|i| i % 3 != 0}
print "問1の3:",c,"\n"

a = a.reverse
print "問1の4:",a,"\n"

sum = 0
a.each do |elem|
	sum += elem
end
print "問1の5:",sum,"\n"

def sum_array(ary1, ary2)
	result = Array.new
	i = 0
	ary1.each do |elem1|
		result << elem1 + ary2[i]
		i += 1
	end
	return result
end
print "問1の6:",sum_array([1,2,3],[4,5,6]),"\n"

#問2
str = "stay foolish stay hungry"
ary = str.split
print "問2の1:",ary,"\n"

str_sort = ary.sort{|a,b| (1)*(a <=> b)}
print "問2の2:",str_sort,"\n"

#問3
wday = {
  "sunday"    => "日曜日",
  "monday"    => "月曜日",
  "tuesday"   => "火曜日",
  "wedensday" => "水曜日",
  "thursday"  => "木曜日",
  "friday"    => "金曜日",
  "saturday"  => "土曜日",
}
print "問3の1:",wday["sunday"],"\n"

print "問3の2:",wday.size,"\n"

%w(sunday monday tuesday wedensday thursday friday saturday).each do |day|
  puts "英語「#{day}」は日本語で#{wday[day]}です。"
end

#問4
def dice
	return rand(6) + 1
end
print "問4の1:",dice,"\n"

def dice10
	sum = 0
	10.times do
		sum += dice
	end
	return sum
end
print "問4の2:",dice10,"\n"