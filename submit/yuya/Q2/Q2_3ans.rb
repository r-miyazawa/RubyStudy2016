puts "数値を入力して下さい"
a = gets.chomp.to_i

if a % 15 == 0 then
  print "Fizz Buzz"
elsif a % 3 == 0 then
  print "Fizz"
elsif a % 5 == 0 then
  print "Buzz"
else
  print a
end