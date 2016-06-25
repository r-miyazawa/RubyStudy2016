


     a = (1..100).to_a
	a2 = a.reverse

	 p a2
	a2 = a.sort{|n1, n2| n2 <=> n1 }

	p a2
a2 = a.sort_by{|i| -i }

p a2

