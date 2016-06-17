=begin
Hit And Blowゲームを完成させよ

【ルール】
ランダムな用意された3桁の数値（解答）を当てるゲーム。
※ゲームクリアするまでの回答数を競うゲーム。
ユーザが答えた3桁の数値に対して、hitまたはblowのヒントを与える。

hitとは
数字も場所も当たっている数字
3hitでゲームクリア
blowとは
数字は当たっているが場所が違う数字

例.正解が123の場合921は
2で1Hit,で1で1Blow

【ゲーム仕様】
•ユーザの入力値をチェックすること（エラーメッセージ表示）
　数値チェック：数値かどうか
　桁数チェック：3ケタかどうか
　同一値チェック：同じ値を入力していないかどうか
•ゲーム中「0」を入力でゲームを終了して初期状態に戻すこと
•ゲームクリア後、回答回数を表示すること
　表示形式：[Hit:○ blow:○]

【コード条件】
•クラス/メソッドを使うこと
=end

class Player
	attr_accessor :number
	protected :number=
	@number = []
	
	def initialize ()
		STDOUT.flush
		numb =  gets.chomp
		@number = numb.scan /\w/
	end
	def number
		@number
	end
	def check
		tmp_1 = @number[0].to_i
		tmp_2 = @number[1].to_i
		tmp_3 = @number[2].to_i
		
		if @number.size === 1 && @number[0].to_i === 0
			exit
		elsif @number.size != 3
			print ("Error do it again \n")
			read
		elsif tmp_1 === 0
			print ("Error do it again \n")
			read
		elsif tmp_2 === tmp_1
			print ("Error do it again \n")
			read
		elsif tmp_2 === tmp_3
			print ("Error do it again \n")
			read
		elsif tmp_1 === tmp_3
			print ("Error do it again \n")
			read
		end
	end
	def read
		STDOUT.flush
		numb =  gets.chomp
		@number = numb.scan /\w/
		check
	end
end

class Pc
	attr_accessor :ranNumber
	protected :ranNumber=
	@ranNumber = []
	def initialize
		ran = rand(999)+100
		ran = ran.to_s
		@ranNumber = ran.scan /\w/
	end
	def compare(number)
		check
		hit = 0
		blow = 0
		tmp1 = 0
		tmp2 = 0
		@ranNumber.each do |rnum|
			number.each do |num|
				if rnum === num && tmp1 === tmp2
					hit += 1
					elsif rnum === num 
					blow += 1
				end
				tmp2 += 1
			end
			tmp2 = 0
			tmp1 += 1
		end
		
		puts "#{@ranNumber}    #{number}   Hit:#{hit}   Blow:#{blow}"
	end
	def check
		tmp_1 = @ranNumber[0].to_i
		tmp_2 = @ranNumber[1].to_i
		tmp_3 = @ranNumber[2].to_i
		
		if @ranNumber.size > 3
			read
		elsif tmp_1 === 0
			read
		elsif tmp_2 === tmp_1
			read
		elsif tmp_2 === tmp_3
			read
		elsif tmp_1 === tmp_3
			read
		end
	end
	def read
		ran = rand(999)+100
		ran = ran.to_s
		@ranNumber = ran.scan /\w/
		check
	end
end

class Game
	def start
		puts "Hit And Blow"
		puts "0 to Exit"
		puts "Insert 3 numbers"

		pc = Pc.new

		player = Player.new
		player.check

		pc.compare(player.number)
		check
	end
	def check
		start
	end
end

game = Game.new
game.start