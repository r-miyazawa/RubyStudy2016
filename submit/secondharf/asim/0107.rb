i=0
j=0

a = Array.new(4).map{Array.new(5)}

for i in 0..3
 for j in 0..4
   a[i][j] = (2+i)**j
 end
end

for i in 0..3
 for j in 0..4
   print a[i][j].to_s.rjust(3)
   print " "
 end
 puts ""
end