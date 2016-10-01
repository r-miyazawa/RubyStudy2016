# coding: utf-8
dir =  __dir__+"/"
require 'test/unit'
require dir+'../card.rb'

class TestCard < Test::Unit::TestCase
    
  sub_test_case "カードメソッド" do
    card = Card.new(2, 1)
    
    test "カード情報を取得" do
      assert_equal [2, 1], card.get_detail
    end
    
    test "カードのナンバーを取得" do
      assert_equal 2, card.get_number
    end
    
    test "カードのスートを取得" do
      assert_equal 1, card.get_suit
    end
    
    test "カードのスート記号を取得" do
      assert_equal '♢', card.get_suit("mark")
    end
    
    test "カードのスート名称を取得" do
      assert_equal 'ダイヤ', card.get_suit("name")
    end
  end
  
  sub_test_case "カードの種類" do
    test "ジョーカー" do
      card = Card.new(0, 0)
      assert_equal [0, 0], card.get_detail
    end
  end

  sub_test_case "カードのしきい値" do
    test "num 1, suit 0" do
      card = Card.new(1, 0)
      assert_equal [nil, nil], card.get_detail
    end
    
    test "suit 5" do
      card = Card.new(1, 5)
      assert_equal [nil, nil], card.get_detail
    end
    
    test "num 0" do
      card = Card.new(0, 1)
      assert_equal [nil, nil], card.get_detail
    end
    
    test "num 14" do
      card = Card.new(14, 0)
      assert_equal [nil, nil], card.get_detail
    end
  end
  
end
