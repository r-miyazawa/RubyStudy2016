# coding: Shift_JIS
print "exam 1 \n"
print "1.\n"

temp = 1..100
a = temp.collect{|i| i}
p a

print "2.\n"

b = temp.collect{|i| i * 100}
p b

print "3.\n"

c = a.delete_if{|i| i % 3 != 0}
p c

print "4.\n"
a = temp.collect{|i| i}
d = a.reverse!
p d

print "5.\n"
sum = 0
a.each do |elem|
  sum += elem
end

print "sum = ",sum,"\n"
 
print "6.\n"
a = temp.collect{|i| i}
f = []
a.zip(b) do |n,m|
  f << n + m
end

p f


print "exam 2 \n"
print "1.\n"

g = ["stay","foolish","stay","hungry"]
p g

print "2.\n"
h = g.sort_by{|i| i}
p h

print "3.\n"
i = []
for m in 0..3
  i[m] = g[m].capitalize
end
p i



print "exam 3 \n"
print "1.\n"

wday = { :sunday => "日曜日", :monday => "月曜日", :tuesday => "火曜日", :wednesday => "水曜日", :thursday => "木曜日", :friday => "金曜日", :Saturday => "土曜日"}


print "2.\n"

print "count:",wday.count,"\n"

print "3.\n"

wday.each do |elem|
	print elem,"\n"
end

print "exam 4 \n"
print "1.\n"

def dice()
  
  x = rand(1..6)

end

print dice()

print "2.\n"

def dice10()

  x = rand(1..6)
  sum = 0
  for i in 1..10
  	x = rand(1..6)
  	sum += x
  end
  
  return sum
end

print dice10()
