def prime?(num)
   # num > 0 check
   return false if num == 1
   (2..Math.sqrt(num)).each do |x|
     if num % x == 0
       return false
     end
   end
   true
 end
 
 (1..100).each do |n|
   puts n if prime?(n)
 end 


print( "\n\n\n")

class Leap
   def checkYear?(n)
     if n%400 == 0
       return true
     end
 
     if n%4 == 0 && n%100 == 0
       return false
    end

     if n%4 == 0
       return true
     end
 
     return false
   end
 end
 
 (0..2014).each do |n|
 leap =  Leap.new
 puts  n   if leap.checkYear?(n)
 end