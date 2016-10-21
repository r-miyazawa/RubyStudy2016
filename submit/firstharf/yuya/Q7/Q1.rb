class Card
	def mSuit
		suits = ["Heart", "Diamond", "Spade", "Clover"]
		puts suits.sample(1)
	end
	
	def mNumber
		p (1..13).to_a.sample(1)
	end
end

card = Card.new

card.mSuit
card.mNumber