# coding: utf-8
dir =  __dir__+"/"
require 'test/unit'
require dir+'../q3.rb'

class TestQ3 < Test::Unit::TestCase
  
  sub_test_case "曜日を表す英語と日本語の対応を表すハッシュwdayを定義せよ" do
    test "" do
      result = {:sunday => "日曜日", :monday => "月曜日", :tuesday => "火曜日",  :wednesday => "水曜日", :thursday => "木曜日",  :friday => "金曜日", :saturday => "土曜日"}
      wday = makeWday

      assert_equal result, makeWday
    end
  end

  sub_test_case "[1]のデータ数の7を取得するコードを記載せよ" do
    test "" do
      result = 7
      wday = makeWday
      wdaylen = getLength(wday)

      assert_equal result, wdaylen
    end
  end


  sub_test_case "eachメソッドを使用し[1]のハッシュから下記結果を取得せよ" do
    # 一週間分の "英語[sunday]は日本語で日曜日です。" 結果
    test "" do
      # test/unit で標準出力をテストできるだけのruby力が僕にはありませんでした
    end
  end
  
end
