puts "1."


5.times do
  print "Hello World!\n"
end

print "\n-------------------------------------------\n"
puts "2."

num1 = (1...10)
num2 = (1...10)

num1.each do |n|
  num2.each do |m|
    printf("%02d ",n*m)
  end
  print "\n"
end

print "\n-------------------------------------------\n"
puts "3."

n=1
while n <= 100
  if (n%3 == 0) && (n%5 == 0) then
    print "Fizz Buzz "
  elsif n%5 == 0 then
    print "Buzz "
  elsif n%3 == 0 then
    print "Fizz "
  else
    printf("%02d ",n)
  end

  if n%15 == 0 then
    puts ""
  end

  n = n+1

end


