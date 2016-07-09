class Card
	def Suit
		
		numS = rand(1..4)
		
		suit = ""
		
		case numS
		when 1 then
			suit = "♠"
		when 2 then
			suit = "♣"
		when 3 then
			suit = "♥"
		else
			suit = "♦"
		end
		
		return suit
	end
	
	def Number
		
		numN = rand(1..13)
	
		return numN
	end
end

def Check(tempCard)
	i = 0
	res = 0
	while i < 5
		j = 0
		while j < 5
			if i != j then
				if tempCard[i] != tempCard[j] then
					res = res + 1
				else
					res = res
				end
				j = j + 1
			else
				j = j + 1
			end
		end
		i = i + 1
	end
	return res
end

card = Card.new()

res = 0
tempCard = []
tempCardNum = []

i = 0

while i < 5
	tempCard[i] = card.Suit,card.Number
	i = i + 1
end

res = Check(tempCard)
while res < 20
	i = 0
	while i < 5
		tempCard[i] = card.Suit,card.Number
		i = i + 1
	end
	res = Check(tempCard)
end
tempCard.each do |i|
	print i," "
end



print "\nチェンジ？(yes/no)"
play = gets.chomp
if play == "yes"
	print "\n何番目ですか(1-5)\n"
	playNum = gets.to_i
	res = 0
	
	case playNum
	when 1 then
		while res < 20
			tempCard[0] = card.Suit,card.Number
			res = Check(tempCard)
		end
	when 2 then
		while res < 20
			tempCard[1] = card.Suit,card.Number
			res = Check(tempCard)
		end
	when 3 then
		while res < 20
			tempCard[2] = card.Suit,card.Number
			res = Check(tempCard)
		end
	when 4 then
		while res < 20
			tempCard[3] = card.Suit,card.Number
			res = Check(tempCard)
		end
	when 5 then
		while res < 20
			tempCard[4] = card.Suit,card.Number
			res = Check(tempCard)
		end
	else
		
	end
	tempCard.each do |i|
		print i," "
	end
else
	print "\nあなたのポーカーは\n"
end

################################################
i = 0
tempNum = [0,0,0,0,0,0,0,0,0,0,0,0,0]
while i < 5
	j = 1
	case tempCard[i][1]
	when 1 then
		tempNum[0] = tempNum[0] + 1
	when 2 then
		tempNum[1] = tempNum[1] + 1
	when 3 then
		tempNum[2] = tempNum[2] + 1
	when 4 then
		tempNum[3] = tempNum[3] + 1
	when 5 then
		tempNum[4] = tempNum[4] + 1
	when 6 then
		tempNum[5] = tempNum[5] + 1	
	when 7 then
		tempNum[6] = tempNum[6] + 1
	when 8 then
		tempNum[7] = tempNum[7] + 1
	when 9 then
		tempNum[8] = tempNum[8] + 1
	when 10 then
		tempNum[9] = tempNum[9] + 1
	when 11 then
		tempNum[10] = tempNum[10] + 1
	when 12 then
		tempNum[11] = tempNum[11] + 1
	else
		tempNum[12] = tempNum[12] + 1
	end
	i = i + 1
end

pokerNum = 0
pokerPrint = ""

i = 1
k = 0
while i < 5
	if tempCard[0][0] == tempCard[i][0] then
		k = k + 1
	else
		k = k
	end
	i = i + 1
end

i = 0
numMax = 0
numMin = 13
numTotal = 0
while i < 5
	if numMax < tempCard[i][1] then
		numMax = tempCard[i][1]
	else
		numMax = numMax
	end
	
	if numMin > tempCard[i][1] then
		numMin = tempCard[i][1]
	else
		numMin = numMin
	end
	
	numTotal = numTotal + tempCard[i][1]
	i = i + 1
end


if tempNum.count(4) == 1 then
	pokerNum = 3
elsif tempNum.count(3) == 1 && tempNum.count(2) == 1 then
	pokerNum = 4
elsif tempNum.count(3) == 1 then
	pokerNum = 7
elsif tempNum.count(2) == 2 then
	pokerNum = 8
elsif tempNum.count(2) == 1 then
	pokerNum = 9
elsif tempNum.count(1) == 5 && k == 4 && (numMax - numMin) == 4 then
	pokerNum = 2
elsif tempNum.count(1) == 5 && k == 4 && numTotal == 47 && (numMax - numMin) == 12 then ## 10,J,Q,K,A
	if tempCard[0][0] == 1 then
		pokerNum = 1
	else
		pokerNum = 2
	end
elsif tempNum.count(1) == 5 && k == 4 then
	pokerNum = 5
elsif tempNum.count(1) == 5 && (numMax - numMin) == 4 then
	pokerNum = 6
elsif numTotal == 47 && (numMax - numMin) == 12 ## 10,J,Q,K,A
	pokerNum = 6
else
	pokerNum = 10
end

case pokerNum
when 1 then
	pokerPrint = "ロイヤルストレートフラッシュ"
when 2 then
	pokerPrint = "ストレートフラッシュ"
when 3 then
	pokerPrint = "フォーカード"
when 4 then
	pokerPrint = "フルハウス"
when 5 then
	pokerPrint = "フラッシュ"
when 6 then
	pokerPrint = "ストレート"
when 7 then
	pokerPrint = "スリーカード"
when 8 then
	pokerPrint = "ツーペア"
when 9 then
	pokerPrint = "ワンペア"
else
	pokerPrint = "ノーペア"
end

################################################


print "\n",pokerPrint