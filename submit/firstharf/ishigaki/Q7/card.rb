class Trump
    @card
    def initialize
        @card = Array.new()
        4.times do |i|
            #カードのマーク
            case i
            when 0 then
                suit = "ハート"
            when 1 then
                suit = "ダイヤ"
            when 2 then
                suit = "クローバー"
            when 3 then
                suit = "スペード"
            end
            (1..13).each do |j|
                @card << Card.new(suit, j)
            end
        end
    end
    def getRandCard
    	return @card[rand(52)]
    end
end

class Card
    @suit
    @number
    def initialize(suit, number)
        @suit = suit
        @number = number
    end
end

trump = Trump.new()
trump.getRandCard


