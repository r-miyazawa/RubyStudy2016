puts "Hello World"

##num0 = ARGV[0].to_i
##num1 = ARGV[1].to_i

##puts "#{num0} + #{num1} = #{num0 + num1}"

=begin
filename = ARGV[0]
file = File.open(filename)
text = file.read
print text
file.close
=end

pattern = Regexp.new(ARGV[0])

filename = ARGV[1]

=begin
file = File.open(filename)
file.each_line do |line|
    if pattern =~ line
        print line
    end
end
file.close
=end

def hello 
    puts "Hello Ruby \n"
end

hello()

require_relative "grep" #「rb」は不要

simple_grep(pattern,filename)

require "date"

days = Date.today - Date.new(1992,5,9)
puts (days.to_i)/365

require "pp"

books = [
    {title: "猫街", author:"太郎"},
    {title: "猫の事務所",author:"宮沢"}
]
p books
pp books