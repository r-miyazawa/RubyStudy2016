
	a = (1..100).to_a
 result = 0

   a.each{|i| result += i }
 p result

p a.inject(0){|memo, i| memo += i }
