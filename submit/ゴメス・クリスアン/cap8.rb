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