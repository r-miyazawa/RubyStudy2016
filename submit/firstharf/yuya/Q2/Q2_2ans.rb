range = 1..9

range.each do |i|
  range.each do |j|
    print(sprintf("%02d", i*j))
    print " "
  end
  print "\n"
end