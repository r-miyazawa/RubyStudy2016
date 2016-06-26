# coding: utf-8

require './deck.rb'
require './card.rb'
require './player.rb'
require './cpu.rb'


# ゲームを管理するクラス
class Game
  @deck = nil # 山札が格納される
  @users = [] # ゲームをプレイするユーザーを格納
  @win_counter = 0 # 勝利数
  @lose_counter = 0 # 敗北数
  @draw_counter = 0 # 引分け数
  
  def initialize
    @deck = make_deck
    @users = []
    @win_counter = 0
    @lose_counter = 0
    @draw_counter = 0
  end

  # プレイユーザーを取得
  # @return {array}
  def get_users
    return @users
  end

  protected
  # プレイユーザーを追加
  # @param {User} user 1ユーザーを表す
  def add_user(user)
    if user.kind_of?(User) === false
      throw :exit
    end
    
    @users << user
  end

  # プレイユーザーにカードを配る
  # @param {number} num カード配る枚数
  def deal_card(num)
    get_users.each do |user|
      num.times do
        user.add_card(@deck.draw_card)
      end
    end
    
  end

  # デッキを生成
  def make_deck
    deck = Deck.new
    
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

    return deck
  end
  
end
