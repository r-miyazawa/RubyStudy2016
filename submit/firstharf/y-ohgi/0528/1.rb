# coding: utf-8
# 課題6

# 下記参考にじゃんけんゲームを完成させよ

# 【仕様】

# 繰り返し処理：
# ジャンケンゲームでユーザにカード（0:グー、1:チョキ、2:パー、end:ゲーム終了）
# を選択させコンピュータと対戦。
# 「自分の手：相手の手：勝ち負けあいこの結果」　を表示。

# end:終了コマンドで「ゲーム数：勝数：負数：引き分け数」を表示。

# 【機能】
# •入力検証は行うこと（文字チェック、選択キー以外なものなど）

# 【コード条件】
# •クラス・メソッドの使用を検討すること


class Janken
  @game_counter = 0 # ゲーム数
  @win_counter = 0 # 勝利数
  @lose_counter = 0 # 敗北数
  @draw_counter = 0 # 引き分け数
  @janken_hand = [] # じゃんけんの手
  
  def initialize
    @game_counter = 0
    @win_counter = 0
    @lose_counter = 0
    @draw_counter = 0
    @janken_hand = ["グー", "チョキ", "パー"]
  end

  # じゃんけんを実行
  # @param {int} hand じゃんけんの手
  def run(hand)
    @game_counter += 1
    hand = hand.to_i
    ehand = genEnemyHand().to_i
    p ehand
    res = (hand.to_i - ehand.to_i + 3) % 3

    result = "#{@janken_hand[hand]} : #{@janken_hand[ehand]} : "
    
    if (res == 0)
      @draw_counter += 1
      result += "あいこ"
    elsif (res == 2)
      @win_counter += 1
      result += "勝ち"
    else
      @lose_counter += 1
      result += "負け"
    end

    return result
  end

  # 相手の手を作る
  # @return {int} 0~2を返す
  def genEnemyHand()
    h = rand(3)
    return h
  end

  def result
    puts "ゲーム数 #{@game_counter} : 勝ち #{@win_counter} : 負け #{@lose_counter} : あいこ #{@draw_counter}"
  end
  
end


def main
  game = Janken.new()
  
  loop do
    print ">> "
    i = $stdin.gets.chomp
    if /^[0-2]$/ === i
      res = game.run(i)
      p res
      next
    elsif i == "end"
      game.result
      return
    else
      puts "0, 1, 2, end のどれかしか受け付けないよ！"
    end
  end
  
end

main
