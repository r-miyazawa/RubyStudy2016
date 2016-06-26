# coding: utf-8

# ポーカーの役を確かめるためのクラス
class Judge
  #@@number = [1, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2] # 数字の強さ順
  @@number = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1] # 数字の強さ順
  
  class << self
    # ロイヤルストレートフラッシュの判定
    # ストレートフラッシュのうち、数字が A, K, Q, J, 10 であること
    # @param {array} 判定するカード
    # @return {boolean}
    def is_royal_straight_flush(cards)
      if is_straight_flush(cards)
        cards = do_1_last_sort(cards)
        numcards = to_simpleary(cards)
        rsf_number = [10, 11, 12, 13, 1]#(R)oyal(S)traight(F)lush number
        
        return rsf_number.join(",").include?(numcards.join(","))
      end
      
      return false
    end

    # ストレートフラッシュの判定
    # ストレートとフラッシュがあること
    # @param {array} 判定するカード
    # @return {boolean}
    def is_straight_flush(cards)
      if is_straight(cards) && is_flush(cards)
        return true
      end

      return false
    end

    # フォーカードの判定
    # 同位札が 4 枚あること
    # @param {array} 判定するカード
    # @return {boolean}
    def is_four_of_a_kind(cards)
      cards = do_1_last_sort(cards)
      numcards = to_simpleary(cards)

      ucards = numcards.uniq

      ucards.each do |n|
        if count_same_card(numcards, n) === 4
          return true
        end
      end

      return false
    end

    # フルハウスの判定
    # ワンペアとスリーカードがあること
    # @param {array} 判定するカード
    # @return {boolean}
    def is_full_house(cards)
      cards = do_1_last_sort(cards)
      numcards = to_simpleary(cards)

      ucards = numcards.uniq

      onepair = false
      threecard = false
      if ucards.length === 2
        
        ucards.each do |n|
          count = count_same_card(numcards, n)
          if count === 2
            onepair = true
          elsif count === 3
            threecard = true
          end
        end

        if onepair && threecard
          return true
        end
        
      end

      return false
    end

    # フラッシュの判定
    # 同種札が 5 枚あること
    # @param {array} 判定するカード
    # @return {boolean}
    def is_flush(cards)
      cards = do_1_last_sort(cards)
      suitcards = to_simpleary(cards, 1)

      ucards = suitcards.uniq

      ucards.each do |n|
        if count_same_card(suitcards, n) === 5
          return true
        end
      end

      return false
    end

    # ストレートの判定
    # 5 枚の数字が連なっていること（4, 3, 2, A, K はストレートではない）
    # @param {array} 判定するカード
    # @return {boolean}
    def is_straight(cards)
      cards = do_1_last_sort(cards)
      numcards = to_simpleary(cards)
      
      return @@number.join(",").include?(numcards.join(","))
    end

    # スリーカードの判定
    # 同位札が 3 枚あること
    # @param {array} 判定するカード
    # @return {boolean}
    def is_three_of_a_kind(cards)
      cards = do_1_last_sort(cards)
      numcards = to_simpleary(cards)

      ucards = numcards.uniq

      ucards.each do |n|
        if count_same_card(numcards, n) === 3
          return true
        end
      end

      return false
    end

    # ツーペアの判定
    # ワンペアが 2 組あること
    # @param {array} 判定するカード
    # @return {boolean}
    def is_two_pair(cards)
      cards = do_1_last_sort(cards)
      numcards = to_simpleary(cards)

      ucards = numcards.uniq

      paircount = 0
      ucards.each do |n|
        if count_same_card(numcards, n) === 2
          paircount += 1
        end
      end

      # ワンペアが 2 つあれば true
      if paircount === 2
        return true
      end

      return false
    end

    # ワンペアの判定
    # 同位札が 2 枚あること
    # @param {array} 判定するカード
    # @return {boolean}
    def is_one_pair(cards)
      cards = do_1_last_sort(cards)
      numcards = to_simpleary(cards)

      ucards = numcards.uniq

      ucards.each do |n|
        if count_same_card(numcards, n) === 2
          return true
        end
      end

      return false
    end

    #private

    # 同じ値を持ったカードを数える。
    # @param {array} numcards 手持ちのカード。self.to_simplearyで整形済みのものを渡す
    # @param {number} num 数えるナンバー
    # @return {number} 何枚存在したか
    def count_same_card(numcards, num)
      count = 0
      numcards.each do |numcard|
        if numcard === num
          count += 1
        end
      end

      return count
    end

    # 1番を一番前に持っていくための関数
    # @param {array} ary 並び替える数値が格納されている配列
    # @return {array}
    def do_1_last_sort(ary)
      res = []
      ary = ary.sort!
      numary = self.to_simpleary(ary.sort)
      breakflg = false
      
      while true do
        
        i = numary.index(1)

        # indexが末尾だった場合、そもそも配列の中に1が存在しない場合はソート完了としてbreak
        if numary.length-1 === i || i ===  nil
          break
        else

          # 発見したindexの後ろに1が続いているか
          (numary.length).times do |n|
            # 発見したindexまで処理を飛ばす
            if n <= i
              next
            end
            
            if numary[n] === 1 && numary.length-1 === n
              # 1 かつ 末尾ならソート完了としてbreak
              breakflg = true
              break
            elsif numary[n] != 1
              # 末尾まで1が続いて居ないためソートに戻る
              break
            end
            
          end # times

          # 発見したindexの後ろも1なのでbreak
          if breakflg == true
            break
          end
          
        end

        numary.push(numary.slice!(i))
        ary.push(ary.slice!(i))
      end #while

      return ary
    end


    # ナンバーとスートの二次元配列を片方の一次元配列へ変換する
    # @param {array} cards 変換対象
    # @param {number} target 一次元配列にする対象
    # @param {array} targetにされた一次元配列
    def to_simpleary(cards, target = 0)
      res = []


      i = 0
      cards.each do |card|
        res << card[target]
        i += 1
      end

      return res
    end
  end

end

#p Judge::do_1_last_sort([[1,2], [2,1], [1,3]])
# p Judge::do_1_last_sort([[1,2], [10,1], [11,3], [12,3], [13, 1]])
#p Judge::to_simpleary([[1,2], [2,1], [1,3]])
# p Judge::is_straight([[1,2], [10,1], [11,3], [12,3], [13, 1]])
# p Judge::is_four_of_a_kind([ [1,2], [1,1], [1,3], [1,4], [13, 1] ])
# p Judge::is_flush([ [1,2], [2,2], [3,2], [4,2], [13, 2] ])
# p Judge::is_full_house([ [1,2], [1,1], [3,2], [3,1], [3, 3] ])
#p Judge::is_royal_straight_flush([[1,1], [10,1], [11,1], [12,1], [13, 1]])
