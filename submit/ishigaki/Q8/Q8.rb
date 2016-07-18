require './card.rb'

def showArray(hand)
	hand.count.times do |i|
		p hand[i]
	end
end

def checkRole(ary)
	aryedi = ary
	# ソート

	4.times do
		4.times do |i|
			if aryedi[i] < aryedi[i+1]
				tmp = aryedi[i]
				aryedi[i] = aryedi[i+1]
				aryedi[i+1]
			end
		end
	end

	showArray(aryedi)
	roleName = "ノーペア"
	case checkRole
	when 0 then
		roleName = "ロイヤルストレートフラッシュ"
	when 1 then
		roleName = "ストレートフラッシュ"
	when 2 then
		roleName = "フォーカード"
	when 3 then
		roleName = "フルハウス"
	when 4 then
		roleName = "フラッシュ"
	when 5 then
		roleName = "ストレート"
	when 6 then
		roleName = "スリーカード"
	when 7 then
		roleName = "ツーペア"
	when 8 then
		roleName = "ワンペア"
	else
		roleName = "エラー"
	end
end

trump = Trump.new()
hand = Array.new()

5.times do
	hand << trump.getRandCard
end

checkRole(hand)
showArray(hand)

flg = 0
begin
	puts "チェンジしますか yes/no"
	val = gets.to_s.chomp
	if val == "yes"
		showArray(hand)
		chnghand = Array.new()
		i=0
		while i < 5
			puts "#{i+1}番目のカードを交換しますか yes/no"
			chngval = gets.to_s.chomp
			if chngval == "yes"
				chnghand << i
				i+=1
			elsif chngval = "no"
				i+=1
			else
				puts "yesかnoを入力してください\n"
			end
		end
		i=0
		chnghand.each do
			val = chnghand[i]
			hand[val] = trump.getRandCard
			i+=1
		end
		# 役のチェック


		showArray(hand)
		flg = 1
	elsif val == "no"
		flg = 1
	else
		puts "yesかnoを入力してください\n"
	end
end while flg != 1
