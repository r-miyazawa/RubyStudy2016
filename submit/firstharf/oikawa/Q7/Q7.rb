class Card
  def initialize()
    @suit = ["Spade", "Diamond", "Clover", "Heart"]
    @number = rand(1..13)
  end
  
  def suit
    print @suit.sample
  end
  
  def number
    print @number
  end
end

card = Card.new()
card.suit
card.number
print "\n"
