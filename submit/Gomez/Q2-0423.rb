5.times do 
    puts "Hello World"
end

(1...10).each do |n|
    (01...10).each do |m|
        res = n*m
        print '%.2i '%res
    end
    print "\n"
end

(1..100).each do |n|
    if n%3==0 and n%5==0
        puts "Fizz Buzz"
    elsif n%3==0
        puts "Fizz"
    elsif n%5==0
        puts "Buzz"
    else
        puts n
    end
end
