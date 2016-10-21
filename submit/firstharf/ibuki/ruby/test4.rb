p. 
puts rand(6) + 1


10 .times{
puts rand(6) + 1


}

def dice10
  total = 0
  10.times do
    me = rand(6) + 1
    total += me
  end
  total
end

puts dice10



