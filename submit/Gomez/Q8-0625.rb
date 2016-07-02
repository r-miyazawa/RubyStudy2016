=begin
課題8

課題7のカードクラスを使いポーカーの役を出力せよ

【機能】
1.ランダムな5枚のカードを配り役を出力する
2.ユーザはカードを1度チェンジできる（チェンジの有無 yes/no）
 2-1.カードチェンジする場合は指定カードを決める(位置指定1,2,3,4,5)
 2-2.指定カードを変更し、最終的なカードの役を出力する

【コード条件】
•クラス・メソッドの使用を考えること
•今後別カードゲームを作成することを考えて汎用的なクラスを設計/作成すること

【ポーカー役について】
ロイヤルストレートフラッシュ　ストレートフラッシュのうち、数字が A, K, Q, J, 10 であること
ストレートフラッシュ　　　　　ストレートとフラッシュがあること
フォーカード　　　　　　　　　OK同位札が 4 枚あること
フルハウス　　　　　　　　　　OKワンペアとスリーカードがあること
フラッシュ　　　　　　　　　　OK同種札が 5 枚あること
ストレート　　　　　　　　　　OK5 枚の数字が連なっていること（4, 3, 2, A, K はストレートではない）
スリーカード　　　　　　　　　OK同位札が 3 枚あること
ツーペア　　　　　　　　　　　OKワンペアが 2 組あること
ワンペア　　　　　　　　　　　OK同位札が 2 枚あること
ノーペア　　　　　　　　　　　5 枚の札がバラバラであること

【コード条件】
•クラス・メソッドの使用を検討すること
　- cardクラスを作成(スート[suit]と数字[number])すること　→課題7のコードを使うこと
=end

require 'pp'

class Card
    @card
    def initialize(suit,number)
        @card = suit.to_s + ' ' + number.to_s
    end
    
    def getCard
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
                card = Card.new(s,n).getCard
                @deck.push(card)
            end
        end
    end
    
    def getDeck
        @deck
    end
end

class RandCard
    @deck
	@rand
    def initialize(deck)
		@deck = deck
    end

	def getRand
		@rand = @deck.shuffle!.shift
    end
end

class Game
	@deck
	@rand
	@hand
	def initialize
        d = Deck.new
        @deck = d.getDeck
		@rand = RandCard.new(@deck)
		@hand = []
		start
    end
	
	def start
		5.times do
			@hand.push(@rand.getRand)
		end
		pp @hand.sort!
		changeCard
		playAgain
	end
	
	def changeCard
		puts "you wanna change a card? Y/N"
		op = checkLet
		if /N|n/ =~ op
			compare
		else
			puts "from 1 to 5 select the card position"
			num = checkNum.to_i
			@hand.delete_at(num-1)
			@hand.push(@rand.getRand)
			puts "New Card"
			pp @hand
			compare
		end
	end
	
	def compare
		
		comp = []
		nEqual = []
		sEqual = []
		
		@hand.each do |i|
			comp.push(i.split)
		end
		
		for i in 0..4
			suits = 0
			nums = 0
			n = comp[i].to_a[1]
			s = comp[i].to_a[0]
			for j in 0..4
				n2 = comp[j].to_a[1]
				s2 = comp[j].to_a[0]
				if n == n2
					nums += 1
				end
				if s == s2
					suits += 1
				end
			end
			nEqual.push(nums.to_s+" "+n.to_s)
			sEqual.push(suits.to_s+" "+s.to_s)
		end
		
		unless nEqual.uniq==nil
			nEqual.uniq!
		end
		
		sEqual.uniq!
		len = nEqual.length
		lenS = sEqual.length
		
		if lenS == 1
			a = splitSuit(sEqual)
			puts "You have a Flush of #{a.pop}"
		elsif len == 5
			a = splitStraight(nEqual)
			a.sort!
			temp = a.inject {|sum, n| sum.to_s + n.to_s }
			
			unless /[1-13]/ =~ temp
				puts "NOTHING"
			else
				##puts "Straight"
			end
		elsif len == 4
			nEqual.sort!
			a = splitNum(nEqual)
			puts "One Pair of #{a.pop}"
		elsif len == 3
			nEqual.sort!
			a = splitNum(nEqual)
			i = nEqual.pop
			j = nEqual.pop
			if i[0].to_i == 3
				puts "One Triple of #{a.pop}"
			else
				puts "Two Pairs of #{a.pop} and #{a.pop}"
			end
		elsif len == 2
			nEqual.sort!
			a = splitNum(nEqual)
			i = nEqual.pop
			j = nEqual.pop
			if i[0].to_i == 3
				puts "FULL HOUSE of #{a.pop} and #{a.pop}"
			else	
				puts "Poker of #{a.pop}"
			end
		end
		
	end
	
	def splitStraight(nums)
		a = []
		nums.each do |n|
			temp = n.split.to_a[1]
			if /A/ =~ temp
				a.push(1)
			elsif /J/ =~ temp
				a.push(11)
			elsif /Q/ =~ temp
				a.push(12)
			elsif /K/ =~ temp
				a.push(1)
			else
				a.push(temp.to_i)
			end
		end
		return a
	end
	
	def splitNum(nums)
		a = []
		nums.each do |n|
			a.push(n.split.to_a[1])
		end
		return a
	end
	
	def splitSuit(nums)
		a = []
		nums.each do |n|
			a.push(n.split.to_a[1])
		end
		return a
	end
	
	def playAgain
		puts "you wanna play again? Y/N"
		op = checkLet
		if /N|n/ =~ op
			exit
		elsif
			Game.new
		end
	end
	
	def checkNum
		STDOUT.flush
        num = gets.chomp
		unless /^[1-5]$/ =~ num
			puts "please choose 1 to 5"
			checkNum
		end
		return num
	end
	
	def checkLet
		STDOUT.flush
        op = gets.chomp
		unless /Y|y|N|n/ =~ op
			puts "please use Y/N"
			checkLet
		end
		return op
	end
end

rndCard = Game.new