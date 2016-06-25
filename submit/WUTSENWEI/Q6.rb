class JyanKen
	@@count = 0
	@@countWin = 0
	@@countLose = 0
	@@countDraw = 0
	
	def JyanKen.count
		@@count
	end
	
	def JyanKen.countWin
		@@countWin
	end
	
	def JyanKen.countLose
		@@countLose
	end
	
	def JyanKen.countDraw
		@@countDraw
	end
	
	def initialize(ans=1)
		@ans = ans
	end
	
	def hand
		@@count += 1
		#0:グー、1:チョキ、2:パー、end:ゲーム終了
		
		playerS = ""
		comS = ""
		gameS = ""
		com = rand(0...3)
		
		case @ans
		when "0" then
			playerS = "グー"
			case com
			when 0 then
				comS = "グー"
				gameS = "引き分け"
				@@countDraw += 1
			when 1 then
				comS = "チョキ"
				gameS = "勝"
				@@countWin += 1
			else
				comS = "パー"
				gameS = "負"
				@@countLose += 1
			end
		when "1" then
			playerS = "チョキ"
			case com
			when 0 then
				comS = "グー"
				gameS = "負"
				@@countLose += 1
			when 1 then
				comS = "チョキ"
				gameS = "引き分け"
				@@countDraw += 1
			else
				comS = "パー"
				gameS = "勝"
				@@countWin += 1
			end
		else
			playerS = "パー"
			case com
			when 0 then
				comS = "グー"
				gameS = "勝"
				@@countWin += 1
			when 1 then
				comS = "チョキ"
				gameS = "負"
				@@countLose += 1
			else
				comS = "パー"
				gameS = "引き分け"
				@@countDraw += 1
			end
		end
		print "あなたは",playerS,",COMは",comS,"勝負は",gameS,"\n"
	end
end

	
ans = gets.chomp
	
while(1)
	
	temp = JyanKen.new(ans)
	
	temp.hand
	
	ans = gets.chomp
	
	if(ans === "end") then
		break;
	end
end

print "ゲーム数：勝数：負数：引き分け数\n"
print JyanKen.count,":",JyanKen.countWin,":",JyanKen.countLose,":",JyanKen.countDraw
	

