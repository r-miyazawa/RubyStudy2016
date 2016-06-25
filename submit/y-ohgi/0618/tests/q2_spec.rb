# coding: utf-8
dir =  __dir__+"/"
require 'test/unit'
require dir+'../q2.rb'

class TestQ2 < Test::Unit::TestCase
  
  sub_test_case "'stay foolish stay hungry'という文字列の各単語を要素とする配列を作成せよ" do
    test "" do
      result = ['stay','foolish','stay','hungry']
      str = 'stay foolish stay hungry'
      splitedary = splitStr(str)

      assert_equal result, splitedary
    end
  end

  sub_test_case "[1]の配列をアルファベット順にソートせよ" do
    test "" do
      result = ["foolish", "hungry", "stay", "stay"]
      str = 'stay foolish stay hungry'
      splitedary = splitStr(str)
      sortedary = sortByAlphabetAry(splitedary)
      
      assert_equal result, sortedary
    end
  end

  sub_test_case "[1]の配列に含まれる文字列を全て単語の先頭を大文字にせよ" do
    test "" do
      result = ['Stay','Foolish','Stay','Hungry']
      str = 'stay foolish stay hungry'
      splitedary = splitStr(str)
      uppedary = changeUppercaseAry(splitedary)
      

      assert_equal result, uppedary
    end
  end

end
