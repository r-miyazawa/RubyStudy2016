class HelloWorld
	Version = "1.0"
	def initialize(myname = "Ruby")
		@name = myname
	end
	
	def hello
		puts "Hello, world. I am #{@name}."
	end
	
	def name=(value)
		@name = value
	end
	
	def name
		@name
	end
	attr_accessor :name
	def greet
		print "Hi, I am #{self.name}.\n"
	end
	class << self
		def hello(name)
			puts "#{name} said hello."
		end
	end
	def self.hellos(name)
		puts "#{name} said hello."
	end
end
bob = HelloWorld.new("Bob")
alice = HelloWorld.new("Alice")
ruby = HelloWorld.new()

bob.hello
p bob.name = "Chris"
bob.greet
p HelloWorld::Version
HelloWorld.hellos("asd")
ruby.hello


#############

class AccTest
	def pub
		puts "pub is a public method."
	end
	
	public :pub
	
	def priv
		puts "priv is a private method."
	end
	
	private :priv
end

acc = AccTest.new
acc.pub
##acc.priv

class Point
	attr_accessor :x, :y
	protected :x=, :y=
	
	def initialize(x=0.0, y=0.0)
		@x, @y = x, y
	end
	
	def swap(other)
		tmp_x, tmp_y = @x, @y
		@x, @y = other.x, other.y
		other.x, other.y = tmp_x, tmp_y
		
		return self
	end
end

p0 = Point.new
p1 = Point.new(1.0,2.0)
p [p0.x,p0.y]
p [p1.x,p1.y]

p0.swap(p1)
p [p0.x,p0.y]
p [p1.x,p1.y]

##p0.x=10.0

class String
	def count_word
		ary = self.split(/\s+/) #selfを空白文字区切りで
		return ary.size
	end
end

str = "Just Another Ruby website"
p str.count_word

class RingArray < Array
	def [](i)
		idx = i % size
		super(idx)
	end
end

wday = RingArray["日","月","火","水","木","金","土"]
p wday[6]
p wday[11]