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
    @@suit = ['◆', '♥', '♤', '♧']
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
	@pcHand
	@hand
	def initialize
        d = Deck.new
        @deck = d.getDeck
		@rand = RandCard.new(@deck)
		@pcHand = []
		@hand = []
    end
	
	def start
		5.times do
			@hand.push(@rand.getRand)
			@pcHand.push(@rand.getRand)
		end

		if compare(@pcHand.sort!) == false
			return true
		end


		pp "==========>>START<<=========="
		pp @hand.sort!
		changeCard
		return playAgain
	end
	
	def changeCard
		puts "you wanna change a card? Y/N"
		op = checkLet
		if /N|n/ =~ op 
			result(@hand,@pcHand)
		else
			puts "from 1 to 5 select the card position"
			num = checkNum.to_i
			@hand[num-1] = @deck.shift
			puts "New Card"
			result(@hand,@pcHand)
		end
	end

	def result(handP,handC)
		tmp1 = compare(handC)
		res1 = tmp1 == false ? "NOTHING" : tmp1
		tmp = compare(handP)
		res = tmp == false ? "NOTHING" : tmp
		puts "Your hand #{handP}"
		puts "PC hand #{handC}"
		puts "Player :#{res}    PC :#{res1}"
	end
	
	def compare(comHand)
		
		comp = []
		nEqual = []
		sEqual = []
		
		comHand.each do |i|
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
		
		if len == 5
			a = splitStraight(nEqual)
			a.sort!
			if a[4]==13 && a[0]<5
				5.times do |i|
					if a[i]<5
						a[i]+=13
					end
				end
			end
			a.sort!
			tm = (a[4]-4..a[4]).to_a
			temp = a.inject {|sum,i| sum + i}
			flag = true
			
			5.times do |i|
				if tm[i] != a[i]
					flag = false
				end
			end
			straight = {"15"=>"A-5 straight","20"=>"2-6 straight","25"=>"3-7 straight",
						"30"=>"4-8 straight","35"=>"5-9 straight","40"=>"6-10 straight",
						"45"=>"7-J straight","50"=>"8-Q straight","55"=>"9-K straight",
						"60"=>"10-A straight","65"=>"J-2 straight","70"=>"Q-3 straight",
						"75"=>"K-4 straight"}
			b = splitSuit(sEqual)
			if !flag 
				return false
			elsif lenS == 1 && temp == 60
				return "#{straight[temp.to_s]} ROYAL flush of #{b.pop}"
			elsif lenS == 1
				return "#{straight[temp.to_s]} flush of #{b.pop}"
			else
				return straight[temp.to_s]
			end
		elsif lenS == 1
			a = splitSuit(sEqual)
			return "You have a Flush of #{a.pop}"
		elsif len == 4
			nEqual.sort!
			a = splitNum(nEqual)
			return "One Pair of #{a.pop}"
		elsif len == 3
			nEqual.sort!
			a = splitNum(nEqual)
			i = nEqual.pop
			j = nEqual.pop
			if i[0].to_i == 3
				return "One Triple of #{a.pop}"
			else
				return "Two Pairs of #{a.pop} and #{a.pop}"
			end
		elsif len == 2
			nEqual.sort!
			a = splitNum(nEqual)
			i = nEqual.pop
			j = nEqual.pop
			if i[0].to_i == 3
				return "FULL HOUSE of #{a.pop} and #{a.pop}"
			else	
				return "Poker of #{a.pop}"
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
				a.push(13)
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
			return false
		else
			return true
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

begin
	win = 0
	lose = 0	
	draw = 0
	rndCard = Game.new
end while rndCard.start

pp "==========>>GAME OVER<<=========="
puts "win:[#{win}] lose:[#{lose}] draw:[#{draw}]"