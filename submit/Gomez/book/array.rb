require 'pp'
array1 = ("Hello Wolrd").split
p array1

array2 = {heart: 3,spade: 'Q',club: 'A'}.to_a
p array2
p Hash[*array2.flatten]

a=[1,2,3,4,5]

p a.slice!(1,2)
p a

b=[1,2,3,4,5]
p b.collect {|item| item *2}
p b
