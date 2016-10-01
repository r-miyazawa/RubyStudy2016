def dice()
  return rand(1..6)
end

def dice10()
  sum = 0
  10.times{
  	sum += dice
  }
  return sum
end

puts dice10
  	