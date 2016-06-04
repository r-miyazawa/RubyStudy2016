def myHand()
	begin
	puts "入力[0:グー、1:チョキ、2:パー、end:ゲーム終了]"
	mine = gets.chomp
	
	if (mine == "0") 
	    mine = 0
	elsif (mine == "1")
	    mine = 1
	elsif (mine == "2")
	    mine = 2
	end
	 
	end until ((mine == 0) || (mine == 1) || (mine == 2) || (mine == "end"))

	return mine
end

def randomCard()
	your = rand(0..2)
	#your = Random.new
	#your.rand(0..2)
	return your
end

def convertHand(hand)
    if (hand == 0)
        hand = "グー"
    elsif (hand == 1)
        hand = "チョキ"
    elsif (hand == 2)
        hand = "パー"
    end
    
    return hand
end


#main
mine = 0
your = 0
count = 0
win = 0
lose = 0
even = 0
result = 0

begin
    your = randomCard()
    
    mine = myHand()
    
    if !(mine == "end")   
        if ((mine == 0 && your == 1) || (mine == 1 && your == 2) || (mine == 2 && your == 0))
            result = "勝ち"
            win += 1
        elsif ((mine == 0 && your == 2) || (mine == 1 && your == 0) || (mine == 2 && your == 1))
            result = "負け"
            lose +=1
        elsif (mine == your)
            result = "引き分け"
            even += 1
        end
        
        mine = convertHand(mine)
        your = convertHand(your)
        
        print "自分の手：", mine, "/相手の手：", your, "/", result, "\n"
        count += 1
        mine = 0
        your = 0
    end
end until (mine == "end")

print "ゲーム数：",  count, "/勝：", win, "/負：", lose, "/引分：", even, "\n"
puts "ゲームを終了しました。"