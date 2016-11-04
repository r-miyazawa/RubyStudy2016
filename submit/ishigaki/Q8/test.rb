class Card
	attr_accessor :card
	def initialize
		@card = Array.new()
	end
end

class Trump < Card
	@suit
	@number
	def initialize
		@suit = 0
		@number = 0
	end

	def setAllTrump
		4.times do |i|
			case i
			when 0 then
				@suit = "Heart"
			when 1 then
				@suit = "Dia"
			when 2 then
				@suit = "Clover"
			when 3 then
				@suit = "Spade"
			end
			(1..13).each do |j|
				@card[] = (@suit, j)
			end
		end
	end
end

trump = Trump.new()
card = trump.setAllTrump()
p card