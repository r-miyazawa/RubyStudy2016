def make_npc
	npc = rand(0...3)
end


def judge(win, lose, draw, game_num)
loop{
	user = gets.chop
	if user == "end"
	 print "ゲーム数：", game_num, "　勝数：", win, "　負数：", lose, "　引き分け数", draw
		break
	end
	npc = make_npc
	var = user.to_i - npc
	if var == -1 || var == 2
		puts "あなたの勝ちです"
		win += 1
		game_num += 1
		redo
	elsif var == 1 || var == -2
		puts "あなたの負けです"
		lose += 1
		game_num += 1
		redo
	elsif var == 0
		puts "あいこです"
		draw += 1
		game_num += 1
		redo
	end
}
end

win = 0
lose = 0
draw = 0
game_num = 0
puts "0:グー　1:チョキ　2:パー　end:ゲーム終了 のどれかを入力してください"
puts judge(win, lose, draw, game_num)
