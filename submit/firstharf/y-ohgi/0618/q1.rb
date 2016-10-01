# coding: utf-8
# 問1.
# 1.1〜100までの整数が昇順に並ぶ配列aを作成せよ
# 2.[1]の配列の各要素を100倍した、新しい配列bを作成せよ
# 3.[1]の配列の各要素から3の倍数のみ取得した、新しい配列cを作成せよ
# 4.[1]の配列を逆順に並び替えせよ
# 5.[1]の配列に含まれる整数の和を求めよ
# 6.数値からなる配列array1と配列array2のそれらのここの要素を足し合わせた結果を配列で返すsum_arrayメソッドを作成せよ
# 実行例）
# p sum_array([1,2,3],[4,5,6]) # 出力: [5,7,9]


# startnum..endnumまでの配列を作成し、その配列を返す
def makeNumAry(startnum, endnum)
  return (startnum..endnum).to_a
end

# 渡された数値が格納された配列を全て100倍し、その配列を返す
def doHundredfoldNumAry(numary)
  resary = []
  
  numary.each do |num|
    resary << num * 100
  end

  return resary
end

# 渡された数値が格納された配列を全て3の倍数を抽出し、その配列を返す
def getTrebleNumAry(numary)
  resary = []

  numary.each do |num|
    if num % 3 === 0
      resary << num
    end
  end
  
  return resary
end

# 渡された数値が格納された配列を逆順にし、その配列を返す
def reverseNumAry(numary)
  return numary.reverse
end

# 渡された数値が格納された配列の要素全ての和を求め、その数値を返す
def addNumAry(numary)
  resnum = 0

  numary.each do |num|
    resnum += num
  end
  
  return resnum
end

# 渡された2つの、数値が格納された配列を個々に足しあわせ、その配列を返す
def sum_array(ary0, ary1)
  resary = []

  longary = ary0
  shortary = ary1
  
  # 配列の長さを確認
  if longary.length < shortary.length
    tmpary = longary
    longary = shortary
    shortary = tmpary
  end

  (longary.length).times do |i|
    resary[i] = longary[i] + shortary[i]
  end
  
  return resary
end
