
#クラス　Hit And Blow
class HAB
  @@count = 0
    
  #答え作成
  def initialize
    @ary = Array.new(3)
    @ary[0] = rand(0..9)
    begin
      @ary[1] = rand(0..9)
    end while @ary[0]==@ary[1]
    begin
      @ary[2] = rand(0..9)
    end while (@ary[0]==@ary[2])||(@ary[1]==@ary[2])
  end
  
  #答えとuser入力値比較
  def check(ans)
    @@count += 1
    hit = 0
    blow = 0
    result = true
    for i in 0..2
      for j in 0..2
        puts "(#{i})#{@ary[i]}  (#{j})#{ans[j]}"
        if (i == j) && (@ary[i] == ans[j].to_i)
          hit += 1
        elsif @ary[i] == ans[j].to_i
          blow += 1
        end
      end
    end
    if hit==3
      result = false
      puts "Hit 3! clear! 回答回数#{@@count}"
    else
      puts "Hit:#{hit} Blow:#{blow}  #{@@count}回目"
    end
    return result
  end
end

#use入力値　同じ数字がないかチェック
def userCheck(user)
  userAry = user.split("")
  for i in 0..userAry.length-1
    for j in i+1..userAry.length
      if(userAry[i]==userAry[j])
        puts "同じ数字は不可"
        return true
      end
    end
  end
  return false
end


hab = HAB.new()  

begin
  #user入力
  begin
    begin
      puts "3桁の整数を入力(0で終了)"
      user = gets.chomp
      if(/^[0-9]{3}$/ =~ user)
        break
      elsif user=="0"
        exit(0)
      else
        puts "3桁の整数ではありません"
      end
    end while true
  end while (userCheck(user)) 
end while (hab.check(user.split("")))