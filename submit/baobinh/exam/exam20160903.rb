puts "mon1"
mark = '*'
10.downto(1) { |i| print((mark *i) + "\n")}

puts "t2"
ary = [1,2,3,4,5]

ary.reverse!

p ary[1..-1]
p ary[1...-2]


puts "------------"

puts "t3"

ary = (-15..-10).to_a
p ary.select { |i| i%3 ==0}
puts "------------"


puts "t4"
o1 = Object.new
o2 = Object.new

if o1.equal?(o2)
	puts("o1")
else
	puts("o2")
end

puts "------------"

puts "t5"
def test(count=9)
	count-=2
	container = [0,1]
	until 0>= count
		container += [(container[-2] + container[-1])]
		count -=1
	end
		return container
end
p test
puts "------------"


puts "mon2"
puts "説明：「..」と　「...」違いところ"
puts "「..」："
puts "「...」："


puts "mon3"
puts "reverseメソッドは、配列の要素の順番を反転させた新しい配列を返します"
puts "reverse!メソッドは、配列の要素の順番を反転させます。reverse自身を変更するメソッドです。
戻り値はレシーバ自身です"

puts "---------"

puts "mon4"
class Tool
  def use
    puts "color:#{@color} tool:#{self.class.to_s}"
  end
 
  def initialize(color)
    @color = color
  end
end
Hammer.new("red").use
