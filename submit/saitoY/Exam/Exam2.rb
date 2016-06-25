#問2.
#1."stay foolish stay hungry"という文字列の各単語を要素とする配列を作成せよ
s = "stay foolish stay hungry"
ary = s.split(" ")
p(ary)
#2.[1]の配列をアルファベット順にソートせよ

p(ary.sort)

#3.[1]の配列に含まれる文字列を全て単語の先頭を大文字にせよ
#p(ary.collect(&:capitalize))
p(ary.collect{|a| a.capitalize})