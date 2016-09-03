# coding: utf-8

# プレイユーザーを表すクラス
class User
  @cards = [] # 手持ちのカード
  
  def initialize
    @cards = []
  end

  # カードを加える
  # @param {Card} card カード一枚を表す
  def add_card(card)
    if card.kind_of?(Card) === false
      return nil
    end
    
    @cards << card
  end

  # カードを取得
  # @return {array} カードが格納されている配列を返す
  def get_cards(to_ary = false)
    if to_ary === true
      cards = []

      @cards.each do |card|
        cards << card.get_detail
      end

      return cards
    end
    
    return @cards
  end


  # 指定位置のカードを取得
  # @param {number} index 配列番号
  # @return {Card} 指定位置のカードを返す、存在しない場合はnilを返す
  def get_card(index)
    if index.kind_of?(Integer) === false || (0..@cards.length-1).cover?(index) === false
      return nil
    end
    
    return @cards[index]
  end
  
  # 視覚的に分かりやすいカード一覧を取得
  # @return {array} カード一覧
  def get_visualize_cards
    res = []
    
    @cards.each do |card|
      res << card.get_visualize
    end
      
    
    return res
  end

  # 指定位置のカードを交換
  # @param {number} index 配列番号
  # @param {Card} card 新たに設置するカード
  # @return {Card} 外されたカードを返す、指定位置にカードが存在しない、もしくは第二引数が存在しない場合はnil
  def set_card(index, card)
    if index.kind_of?(Integer) === false|| (0..@cards.length-1).cover?(index) === false || card.kind_of?(Card) === false
      return nil
    end

    oldcard = @cards[index]
    @cards[index] = card

    return oldcard
  end

  # カードを全て捨てる
  # @return {array} 捨てたカード一覧
  def dump_cards
    cards = @cards
    @cards = []
    return @cards
  end

end
