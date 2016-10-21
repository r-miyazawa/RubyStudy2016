=begin
課題7

トランプで52枚のカードを用意し、１枚のカードをランダムに表示せよ

カードは1~13までのスート（ハート、ダイヤ、スペード、クローバ）で52枚とする
※ジョーカーはなし

※課題8よりカードクラスを使った課題とします

【仕様】

•52枚のカードを用意（初期化）
•カードをランダムに表示

【機能】
なし

【ヒント】
ランダム生成メソッド：
http://ref.xaio.jp/ruby/classes/array/sample

【コード条件】
•クラス・メソッドの使用を検討すること
　- cardクラスを作成(スート[suit]と数字[number])すること
=end

##課題７
require 'pp'

suit = [:heart,:diamond,:club,:spade]
num = ['A',2,3,4,5,6,7,8,9,10,'J','Q','K']
deck = []
i=0
j=0

52.times do |n|
	deck[n] = [suit[j],num[i%13]]
	i += 1
	if i%13 == 0
		j += 1
	end    
end

pp Hash[*deck]

##課題８
require 'pp'

class Card
    @card
    def initialize(suit,number)
        @card = suit.to_s + ' ' + number.to_s
    end
    
    def getcard
        @card
    end
end

class Deck
    attr_accessor :deck, :suit, :num
    protected :deck=,:suit=,:num=
    
    @deck
    @@suit = ['heart','diamond','club','spade']
    @@num = ['A',2,3,4,5,6,7,8,9,10,'J','Q','K']
    
    def initialize
        @deck = []
        @@suit.each do |s|
            @@num.each do |n|
                card = Card.new(s,n).getcard
                @deck.push(card)
            end
        end
    end
    
    def getdeck
        @deck
    end
end

class RandCard
    @deck
    def initialize
        d = Deck.new
        @deck = d.getdeck
        puts '52 Random Card'
    end
    
    def rnd
        p @deck.sample(52)
    end
end

rndCard = RandCard.new.rnd