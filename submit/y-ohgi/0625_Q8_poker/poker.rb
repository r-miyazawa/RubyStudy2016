# coding: utf-8
require './game.rb'
require './judge.rb'

# PlayerとCpuで1:1のポーカーを行うクラス
class Poker < Game
  # 使用する役一覧
  @@roles = ["royal_straight_flush", "straight_flush", "four_of_a_kind", "full_house", "flush", "straight", "three_of_a_kind", "two_pair", "one_pair"]
  
  def initialize
    super

    # ゲームをプレイするユーザーを追加
    add_user(Player.new)
    add_user(Cpu.new)

    # カードを5枚配る
    deal_card(5)

  end

  # 役を取得
  # @param {User} user 確認する対象ユーザー
  # @return {} 役
  def get_role(usertype)
    cards = []
    
    get_users.each do |user|
      if user.kind_of?(usertype)
        cards = user.get_cards(true)
        break
      end
    end
    
    return judge_role(cards)
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
  
end

po = Poker.new
#p po.get_users
p po.get_role(Player)


100.times do |n|
  po = Poker.new
  #p po.get_users
  p po.get_role(Player)
  

end

