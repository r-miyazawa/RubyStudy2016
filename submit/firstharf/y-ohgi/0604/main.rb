# coding: utf-8
# 課題7

# トランプで52枚のカードを用意し、１枚のカードをランダムに表示せよ

# カードは1~13までのスート（ハート、ダイヤ、スペード、クローバ）で52枚とする
# ※ジョーカーはなし

# ※課題8よりカードクラスを使った課題とします

# 【仕様】

# •52枚のカードを用意（初期化）
# •カードをランダムに表示

# 【機能】
# なし

# 【ヒント】
# ランダム生成メソッド：
# http://ref.xaio.jp/ruby/classes/array/sample

# 【コード条件】
# •クラス・メソッドの使用を検討すること
# 　- cardクラスを作成(スート[suit]と数字[number])すること

require './deck.rb'
require './card.rb'

num_range = 1..13 # ナンバーの範囲
suit_range = 1..4 # スートの範囲
deck = Deck.new # 山札

# カードの生成し、山札へ追加
num_range.each do |num|
  suit_range.each do |suit|
    deck.add_card(Card.new(num, suit))
  end
end

# 山札を並び替える
deck.shuffle
# 現在の山札の枚数
p deck.get.length #=> 52
# 山札からカードを引く
p deck.draw_card.get_detail #=> [9, 3]
# 残りの山札の枚数
p deck.get.length #=> 51
