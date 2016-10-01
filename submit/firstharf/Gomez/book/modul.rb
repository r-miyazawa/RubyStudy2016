module HelloModule
	Version = "1.0"
	
	def hello(name)
		puts "Helllo, #{name}."
	end
	
	module_function :hello
end

p HelloModule::Version
HelloModule.hello("Chris")

=begin
include HelloModule
p Version
=end

class MyClass
	include HelloModule
end

cl = MyClass.new

MyClass.include?(HelloModule)

p MyClass.ancestors
p MyClass.superclass

module Edition
	def edition(n)
		"#{self} IS the #{n} capitule."
	end
end

str = "Ruby"
str.extend(Edition)

p str.edition(5)