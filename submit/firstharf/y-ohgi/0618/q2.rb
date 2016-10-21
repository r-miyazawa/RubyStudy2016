# coding: utf-8
# 問2.
# 1."stay foolish stay hungry"という文字列の各単語を要素とする配列を作成せよ
# 2.[1]の配列をアルファベット順にソートせよ
# 3.[1]の配列に含まれる文字列を全て単語の先頭を大文字にせよ

# 与えられた文字列を半角スペースで区切り配列し、その配列を返す
def splitStr(str)
  return str.split(" ")
end

# 渡された配列をアルファベット順にソートを行い、その配列を返す
def sortByAlphabetAry(ary)
  return ary.sort
end

# 渡された配列の各要素の先頭文字を大文字にし、その配列を返す
def changeUppercaseAry(ary)
  return ary.map {|str| str.capitalize}
end

