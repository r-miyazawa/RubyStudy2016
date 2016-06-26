# coding: utf-8
require './game.rb'
require './judge.rb'

# PlayerとCpuで1:1のポーカーを行うクラス
class Poker < Game
  # 使用する役一覧
  @@roles = ["royal_straight_flush", "straight_flush", "four_of_a_kind", "full_house", "flush", "straight", "three_of_a_kind", "two_pair", "one_pair"]
  @@roles_name = ["ロイヤルストレートフラッシュ", "ストレートフラッシュ", "フォーカード", "フルハウス", "フラッシュ", "ストレート", "スリーカード", "ツーペア", "ワンペア"]
  
  def initialize
    super

    # ゲームをプレイするユーザーを追加
    add_user(Player.new)
    add_user(Cpu.new)

    # カードを5枚配る
    deal_card(5)

  end

  def goto_next_game
    collect_cards
    deal_card(5)
  end


  # 役を取得
  # @param {User} user 確認する対象ユーザー
  # @return {} 役
  def get_role(usertype, isputs=false)
    res = ""
    cards = []
    
    get_users.each do |user|
      if user.kind_of?(usertype)
        cards = user.get_cards(true)
        break
      end
    end
    
    role = judge_role(cards)

    if isputs
      if role != nil
        res = @@roles_name[@@roles.index(role)]
      else
        res = "ノーペア"
      end
    else
      res = role
    end
    
    
    return res
  end

  # 役を判定
  # @param {array} cards 判定対象となるカード
  # @return {} 役
  def judge_role(cards)
    role = nil

    # 約一覧の中にある役を全て判定
    @@roles.each do |rolename|
      if res = Judge.send("is_#{rolename}", cards)
        role = rolename
        break
      end
    end
    
    return role
  end

  def result
    res = {}
    result = 0

    playersrole = @@roles.index(get_role(Player))
    cpusrole = @@roles.index(get_role(Cpu))

    # XXX: うへあ、"no_pair"を得られるようにしとけばよかった
    if playersrole === nil && cpusrole === nil
      result = 2
      @draw_counter += 1
    elsif playersrole === nil
      result = 1
      @lose_counter += 1
    elsif cpusrole === nil
      result = 0
      @win_counter += 1
    elsif playersrole === cpusrole
      result = 2
      @draw_counter += 1
    elsif playersrole < cpusrole
      result = 0
      @win_counter += 1
    elsif playersrole > cpusrole
      result = 1
      @lose_counter += 1
    end
    
    res = {
      :result => result,
      :win_count => @win_counter,
      :lose_count => @lose_counter,
      :draw_count => @draw_counter
    }
    return res
  end

end

#po = Poker.new
#p po.get_users
#p po.get_role(Player)


