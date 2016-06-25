class Card
	def initialize
		@suit = rand(0..3)
		@number = rand(1..13)
		case @suit
			when 0 then @suit = "♠"
			when 1 then @suit = "♡"
			when 2 then @suit = "♢"
			when 3 then @suit = "♣"
		end
		puts "#{@suit}#{@number}"
	end
end

card = Card.new()