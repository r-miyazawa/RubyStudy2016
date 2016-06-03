class HelloCount
	@@count = 0
	
	def HelloCount.count
		@@count
	end
	
	def initialize(myname="ruby")
		@name= myname
	end
	
	def hello
		@@count +=1
		puts "Hello, world. I am #{@name}.\n"
	end
end

bob = HelloCount.new("Bob")
ruby = HelloCount.new

p HelloCount.count
bob.hello
ruby.hello
p HelloCount.count