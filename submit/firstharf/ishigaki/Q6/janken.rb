class Janken
	@player
	@cpu
	@round
	@win
	@draw
	@lose
	def initialize
		@player = @cpu = 0
		@round = @win = @draw = @lose = 0
	end
	def setHand(hand)
		@player = hand
	end
	def setCpuHand
		@cpu = rand(2)
	end
	def getHand(hand)
		case hand
		when 0 then
			obj = "グー"
		when 1 then
			obj = "チョキ"
		when 2 then
			obj = "パー"
		end
		return obj
	end
	def judge
		if @player == @cpu
			@draw += 1
			puts "引き分けです。"
		elsif @player < @cpu || ((@player == 2) && @cpu == 0)
			@win += 1
			puts "貴方の勝ちです。"
		else
			@lose += 1
			puts "貴方の負けです。"
		end
	end
	def countUp
		@round += 1	
	end
	def showHand
		puts "貴方の手：#{getHand(@player)}"
	end
	def showCpuHand
		puts "CPUの手：#{getHand(@cpu)}"
	end
	def showScore
		puts "ゲーム数：#{@round},勝ち：#{@win},負け#{@lose},引き分け#{@draw}"
	end
end

you = Janken.new()
loop do
	print "[0:グー、1:チョキ、2:パー、end:ゲーム終了]"
	flg = gets.to_s.chomp

	if flg == "end"
		break
	elsif flg.to_i >= 0 && flg.to_i <= 2
		flg = flg.to_i
		you.countUp
		you.setHand(flg)
		you.setCpuHand
		you.showHand
		you.showCpuHand
		you.judge
	end
end

puts you.showScore


