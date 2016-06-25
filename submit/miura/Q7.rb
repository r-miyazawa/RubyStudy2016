=begin
	
課題7

トランプで52枚のカードを用意し、１枚のカードをランダムに表示せよ

カードは1~13までのスート（ハート、ダイヤ、スペード、クローバ）で52枚とする
※ジョーカーはなし

※課題8よりカードクラスを使った課題とします

【仕様】

•52枚のカードを用意（初期化）
•カードをランダムに表示

【機能】
なし

【ヒント】
ランダム生成メソッド：
http://ref.xaio.jp/ruby/classes/array/sample

【コード条件】
•クラス・メソッドの使用を検討すること
　- cardクラスを作成(スート[suit]と数字[number])すること
	
=end

class Card
	def suit_number
		mk = ["Spade", "Heart", "Dia", "Club"]
		num = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q" ,"K"]
		puts mk.sample 
		puts num.sample
	end
end

card = Card.new

card.suit_number