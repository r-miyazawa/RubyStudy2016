#問3.
#1.曜日を表す英語と日本語の対応を表すハッシュwdayを定義せよ
wday = {
	:sunday => "日曜日",
	:monday => "月曜日",
	:tuesday =>"火曜日",
	:wednesday => "水曜日",
	:thursday => "木曜日",
	:friday => "金曜日",
	:saturday => "土曜日",
	:sunday => "日曜日",
}


#実行例)
p wday[:sunday] # 出力: "日曜日"

#2.[1]のデータ数の7を取得するコードを記載せよ
p wday.length


#3.eachメソッドを使用し[1]のハッシュから下記結果を取得せよ
wday.each{|key, val| puts "英語「#{key}」は日本語で「#{val}」です。"}

#英語[sunday]は日本語で日曜日です。
#〜(一週間分)