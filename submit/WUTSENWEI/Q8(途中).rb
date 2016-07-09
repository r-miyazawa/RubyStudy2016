class Card
	def Suit
		
		numS = rand(1..4)
		
		suit = ""
		
		case numS
		when 1 then
			suit = "♠"
		when 2 then
			suit = "♣"
		when 3 then
			suit = "♥"
		else
			suit = "♦"
		end
		
		return suit
	end
	
	def Number
		
		numN = rand(1..13)
	
		return numN
	end
end

card = Card.new()

res = 0
tempCard = []

while res < 20
	
	i = 0
	res = 0
	while i < 5
		tempCard[i] = card.Suit,card.Number
		i = i + 1
	end
	i = 0
	j = 0
	while i < 5
		j = 0
		while j < 5
			if i != j then
				if tempCard[i] != tempCard[j] then
					res = res + 1
				else
					res = res
				end
				j = j + 1
			else
				j = j + 1
			end
		end
		i = i + 1
	end
end

tempCard.each do |i|
	print i," "
end


##################

i = 0
j = 0
finalTotal = 1
tempTotal = 1
k = 0
while i < 5
	j = i
	while j < 5
		if i != j then
			if tempCard[i][1] == tempCard[j][1]
				tempTotal = tempTotal + 1
			else
				tempTotal = tempTotal
			end
			j = j + 1
		else
			j = j + 1
		end
	end
	if finalTotal < tempTotal then
		finalTotal = tempTotal
	else
		finalTotal = finalTotal
	end
	tempTotal = 1
	i = i + 1
end

########################


poker = ""

case finalTotal
when 1 then
	poker = "ノーペア"
when 2 then
	poker = "ワンペア"
when 3 then
	poker = "スリーカード"
when 4 then
	poker = "フォーカード"
else
	poker = "ツーペア"
end

print "\n",poker

