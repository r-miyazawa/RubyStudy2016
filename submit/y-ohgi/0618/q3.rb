# coding: utf-8
# 問3.
# 1.曜日を表す英語と日本語の対応を表すハッシュwdayを定義せよ
#  実行例)
#  p wday[:sunday] # 出力: "日曜日"
# 2.[1]のデータ数の7を取得するコードを記載せよ
# 3.eachメソッドを使用し[1]のハッシュから下記結果を取得せよ
#  英語[sunday]は日本語で日曜日です。
#  〜(一週間分)

# 英語のkeyと日本語のvalueで曜日を表すハッシュを作成
def makeWday
  return {:sunday => "日曜日", :monday => "月曜日", :tuesday => "火曜日",  :wednesday => "水曜日", :thursday => "木曜日",  :friday => "金曜日", :saturday => "土曜日"}
end

# 渡されたハッシュの長さを返す (何故僕は関数を定義しているのか自分でも意味がわからない)
def getLength(hash)
  return hash.length
end

# 渡されたハッシュを指定された形式で標準出力
#  英語[sunday]は日本語で日曜日です。
def putsHash(hash)
  hash.each do |key, val|
    puts "英語[#{key}]は日本語で#{val}です。"
  end
end
