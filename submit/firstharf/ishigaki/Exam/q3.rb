puts "問1"
wday = {
	:sunday => "日曜日",
	:monday => "月曜日",
	:tuesday => "火曜日",
	:wednesdau => "水曜日",
	:thursday => "木曜日",
	:friday => "金曜日",
	:saturday => "土曜日"
}
p wday[:sunday]

puts "問2"
puts "問1の配列は#{wday.count}です"

puts "問3"
wday.each{|key, value|
	puts "英語[#{key}]は日本語で#{value}"
}