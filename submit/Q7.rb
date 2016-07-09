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

Shuffle = Card.new()

print Shuffle.Suit,Shuffle.Number