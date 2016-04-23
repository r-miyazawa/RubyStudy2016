5.times do
 puts "hello world"
end




(01...10).each do |i|
     (01...10).each do |j|
         print i*j, " "
     end
     puts  ""
 end



(1...100).each do |i|
    if i%15 == 0
      print "FizzBuzz,"
  elsif i%3 == 0
    print "Fizz,"
  elsif i%5 == 0
   puts "Buzz,"
 else 
    print "#{i},"
  end
 end
