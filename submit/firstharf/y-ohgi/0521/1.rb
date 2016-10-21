# coding: utf-8
# 課題5
# Hit And Blowゲームを完成させよ
#
# 【ルール】
# ランダムな用意された3桁の数値（解答）を当てるゲーム。
# ※ゲームクリアするまでの回答数を競うゲーム。
# ユーザが答えた3桁の数値に対して、hitまたはblowのヒントを与える。
#
# hitとは
# 数字も場所も当たっている数字
# 3hitでゲームクリア
# blowとは
# 数字は当たっているが場所が違う数字
#
# 例.正解が123の場合921は
# 2で1Hit,で1で1Blow
#
# 【ゲーム仕様】
# •ユーザの入力値をチェックすること（エラーメッセージ表示）
# 　数値チェック：数値かどうか
# 　桁数チェック：3ケタかどうか
# 　同一値チェック：同じ値を入力していないかどうか
# •ゲーム中「0」を入力でゲームを終了して初期状態に戻すこと
# •ゲームクリア後、回答回数を表示すること
# 　表示形式：[Hit:○ blow:○]
#
# 【コード条件】
# •クラス/メソッドを使うこと


class HitAndBlow
  @hit_counter = 0 # hitした数の合計
  @blow_counter = 0 # blowした数の合計
  @try_counter = 0 # 入力した回数
  @correct_number = 0 # 今回の正解値

  def initialize(num)
    @hit_counter = 0
    @blow_counter = 0
    @try_counter = 0
    @correct_number = generateNumber(num)
    
    #p @correct_number
  end

  # 正解のナンバーを生成
  # hit and blow の数値の長さ
  def generateNumber(len)
    correct = 0
    exists = []
    
    len.times do |n|
      
      loop do
        num = rand(9)+1
        if !exists.include?(num)
          exists.push(num)
          break
        end
      end
      
    end
    correct = exists.join
    
    return correct
  end

  # ターンの実行
  def run(nums)
    hit = 0
    blow = 0
    @try_counter += 1
    
    (nums.length).times do |num|
      h = self.isHit(nums[num],num)
      
      if(h)
        hit += 1
      else
        b = self.isBlow(nums[num])
        if(b)
          blow += 1
        end
      end
    end

    if (nums.length) === hit
      return true
    else
      puts "[hit:#{hit} blow:#{blow}]"
      return false
    end    
  end


  # 結果の確認
  def result
    puts "[hit:#{@hit_counter} blow:#{@blow_counter} try:#{@try_counter}]"
  end

  # hitの判定
  def isHit(num, len)
    # hitチェック
    if num == @correct_number[len]
      @hit_counter += 1
      return true
    else
      return false
    end
  end

  # blowの判定
  def isBlow(num)
    # どこかでblowしていないかチェック

    (@correct_number.length).times do |n|
      if @correct_number[n] == num
        @blow_counter += 1
        return true
      end
    end
    
    return false
  end
  
end


def main
  game = HitAndBlow.new(3) # new(桁数)
  
  loop do
    print ">> "
    i = $stdin.gets.chomp
    if /[\d]{3}/ === i # i === /[\d]{3}/
      res = game.run(i)
      
      if res
        break;
      end
      
    elsif i == "0"
      return
    else
      puts "数字三桁で入力してね！"
    end
  end
  
  game.result
end

main
