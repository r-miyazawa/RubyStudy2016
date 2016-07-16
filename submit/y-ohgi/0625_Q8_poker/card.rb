# coding: utf-8

# １枚のカードを表すクラス
class Card
  # スートの記号
  @@suit_mark = ['$', '♢', '♡', '♠', '♣']
  # スートの名称
  @@suit_name = ['ジョーカー', 'ダイヤ', 'ハート', 'スペード', 'クラブ']
  # ナンバーの名称
  @@number_name = [nil, 'A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
  
  @number # カードのナンバー
  @suit # カードのスート

  def initialize(num, suit)
    # 例外処理
    if !num.kind_of?(Integer) || !suit.kind_of?(Integer)
      return
    elsif num === 0 && suit === 0
      # ジョーカー
    elsif num < 1 || num > 13
      return
    elsif suit < 1 || suit > 4
      return
    end

    @num = num
    @suit = suit
  end

  # カード情報を取得
  def get_detail
    return [get_number, get_suit]
  end

  # 視覚的に分かりやすいカード情報を取得
  def get_visualize
    return [@@number_name[@num], get_suit("mark")]
  end
  
  # カードのナンバーを取得
  def get_number
    return @num
  end

  # カードのスートを取得
  def get_suit(type = nil)
    if type == "mark"
      return @@suit_mark[@suit]
    elsif type == "name"
      return @@suit_name[@suit]
    else
      return @suit
    end
  end
  
end
