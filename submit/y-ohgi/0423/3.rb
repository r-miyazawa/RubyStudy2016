range = 1..100

range.each { |num|
  if num % 15 === 0
    puts "FizzBuzz"
  elsif num % 5 === 0
    puts "Buzz"
  elsif num % 3 === 0
    puts "Fizz"
  else
    puts num
  end
  
}
