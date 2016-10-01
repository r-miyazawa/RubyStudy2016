# coding: utf-8
dir =  __dir__+"/"
require 'test/unit'
require dir+'../deck.rb'
require dir+'../card.rb'

class DeckCard < Test::Unit::TestCase
  sub_test_case "メソッド" do
    
    test "空の山札を取得" do
      deck = Deck.new
      assert_equal [], deck.get
    end

    test "山札へカードを追加" do
      deck = Deck.new
      assert_equal true, deck.add_card(Card.new(1,1))
    end

    test "山札へカード以外を追加" do
      deck = Deck.new
      assert_equal false, deck.add_card([1, 1])
    end
  end

  
  sub_test_case "52枚の山札" do
    # 13のナンバー, 4つのスートの標準的な山札を作成
    def make_normaldeck
      @deck = Deck.new

      (1..13).each do |num|
        (1..4).each do |suit|
          @deck.add_card(Card.new(num, suit))
        end
      end
    end
    
    test "52毎存在するか" do
      make_normaldeck
      assert_equal 52, @deck.get.length
    end

    test "１枚引く" do
      make_normaldeck
      assert_equal [1, 1], @deck.draw_card.get_detail
    end

    test "52回引く" do
      make_normaldeck
      (1..13).each do |n|
        (1..4).each do |s|
          assert_equal [n, s], @deck.draw_card.get_detail
        end
      end
    end
    
    test "53回引く" do
      make_normaldeck
      (1..13).each do |n|
        (1..4).each do |s|
          @deck.draw_card.get_detail
        end
      end

      assert_equal nil, @deck.draw_card
    end

    test "ジョーカーを追加する" do
      make_normaldeck
      @deck.add_card(Card.new(0, 0))

      assert_equal 53, @deck.get.length
      assert_equal [0, 0], @deck.get[@deck.get.length-1].get_detail
    end

    test "山札を混ぜる" do
      make_normaldeck
      ds0 = @deck.shuffle[0].get_detail
      ds1 = @deck.shuffle[0].get_detail
      ds2 = @deck.shuffle[0].get_detail

      assert_equal true, ds0 != ds1 || ds1 != ds2 || ds2 != ds0
    end
  end
  
end
