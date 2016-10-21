# coding: utf-8
dir =  __dir__+"/"
require 'test/unit'
require dir+'../q4.rb'

class TestQ4 < Test::Unit::TestCase
  
  sub_test_case "1個のさいころを振って出た目を返すメソッドdiceを作成せよ" do
    test "" do
      result = false
      range = 1..6

      prevres = 0
      range.each do
        res = dice
        if prevres === 0
          prevres = res
        end
        
        if (range).cover?(res) && res != prevres
          result = true
          break
        end
      end
      

      assert_equal true, result
    end
  end

  sub_test_case "10個のさいころを振って出た目の合計値を返すメソッドdice10を作成せよ" do
    test "" do
      result = false
      range = 6..60
      
      prevres = 0
      range.each do
        res = dice10
        if prevres === 0
          prevres = res
        end
        
        if (range).cover?(res) && res != prevres
          result = true
          break
        end
      end

      assert_equal true, result
    end
  end

end
