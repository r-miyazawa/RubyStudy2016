def dice10
  dicesum = 0
  10.times do
	dicesum = dicesum + (rand(6) + 1)
  end
  puts dicesum
end

dice10

