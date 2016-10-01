
#クラス　じゃんけん
#ジャンケンゲームでユーザにカード（0:グー、1:チョキ、2:パー、end:ゲーム終了）
class Janken
  @@count = 0
  @@win = 0
  @@drow = 0
  @@lose = 0
  
  #数値=> もじ
  def hand(num)
    hand = ""
    case num
      when 0
        hand = "グー"
      when 1
        hand = "チョキ"
      when 2
        hand = "パー"
    end
    return hand
  end
  
  #答えとuser入力値比較
  def battle(user)
    @@count += 1
    com = rand(0..2)
    if user==com
      result = "drow"
      @@drow += 1
    elsif user-com==1||user-com==-2
      result = "lose"
      @@lose += 1
    elsif com-user==1||com-user==-2
      result = "win"
      @@win += 1
    end
    
    puts "自分:#{hand(user)} COM:#{hand(com)}  #{result}"
  end
  
  #終了
  def last()
    puts "#{@@count}戦 #{@@win}勝 #{@@lose}敗 #{@@drow}引き分け"
    exit(0)
  end
  
end


janken = Janken.new()  

#user入力
begin
  puts "じゃんけんの手を入力（0:グー、1:チョキ、2:パー、end:ゲーム終了）"
  user = gets.chomp
  if(/^[0-2]$/ =~ user)
    janken.battle(user.to_i)
  elsif user=="end"
    janken.last()
  else
    puts "入力値が不適格です"
  end
end while true
