5.times do 
    puts "Hello World"
end

(01...10).each do |n|
    (01...10).each do |m|
        print n*m, " "
    end
    print "\n"
end

(01...100).each do |n|
    if n%3==0 and n%5==0
        puts "Fizz Buzz"
    elsif n%3==0
        puts "Fizz"
    elsif n%5==0
        puts "Buzz"
    end
end