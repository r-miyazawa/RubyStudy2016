# coding: utf-8

# カードの山札
class Deck
  @stack # 残りの山札
  
  def initialize
    @stack = []
  end

  # 山札を並び替える
  def shuffle
    return @stack.shuffle!
  end
  
  # 残りの山札を取得
  def get
    return @stack
  end
  
  # カードを追加
  def add_card(card)
    if !card.kind_of?(Card)
      return false
    end
    
    @stack.push(card)
    
    return true
  end

  # 山札から一枚引く
  def draw_card
    if @stack.length === 0
      return nil
    end
      
    return @stack.slice!(0)
  end
end
