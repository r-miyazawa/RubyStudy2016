

a =  (1..100).to_a
p a.sort

a =  (1..100).to_a
result = 0

	a.each{|i| result += i }

	p result

a4 =  (1..100).to_a
p a4.sort { |a , b|  b <=> a}


a2 = a.collect{|i| i * 100 }
p a2

a3 = a.select{|i| i % 3 == 0 }

p a3




a1  = [1, 2, 3]
a2  = [4, 5, 6]

sum = (Vector.elements(a1) + Vector.elements(a2)).to_a	 



