$x=0
x=0
TEST = 1

require_relative "grep"

p $x
p x , TEST

a,*b,c = 1,2,3,4,5
p [a,b,c]

c,d = b

p [c,d]

p /Ruby/ =~ "Rusby"

unless c==2
    puts "different from 3"
else
    puts "2"
end