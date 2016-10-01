#Q1
#1.1〜100までの整数が昇順に並ぶ配列aを作成せよ
  a = (1..100).to_a
  #p a

#2.[1]の配列の各要素を100倍した、新しい配列bを作成せよ
  a = (1..100).to_a
  b = a.collect!{|i| i * 100}
  #p b

#3.[1]の配列の各要素から3の倍数のみ取得した、新しい配列cを作成せよ
  a = (1..100).to_a
  c = a.select{|i| i % 3 == 0}
  #p c

#4.[1]の配列を逆順に並び替えせよ
  a = (1..100).to_a
  a.reverse!
  #p a

#5.[1]の配列に含まれる整数の和を求めよ
  a = (1..100).to_a
  #p a.reduce{|sum, i| sum + i}

#6.数値からなる配列array1と配列array2のそれらのここの要素を足し合わせた結果を配列で返すsum_arrayメソッドを作成せよ
  def sum_array(arr1,arr2)
  	arr1.zip(arr2).collect{|arr1, arr2| arr1 + arr2}
  end
  
  arr1 = [1,2,3]
  arr2 = [4,5,6]
  #p sum_array(arr1, arr2)

#Q2
#1."stay foolish stay hungry"という文字列の各単語を要素とする配列を作成せよ
  str = "stay foolish stay hungry"
  arr = str.split(" ")
  #p arr

#2.[1]の配列をアルファベット順にソートせよ
  #p arr.sort

#3.[1]の配列に含まれる文字列を全て単語の先頭を大文字にせよ
  #p arr.collect(&:capitalize)

#問3.
#1.曜日を表す英語と日本語の対応を表すハッシュwdayを定義せよ
  wday = { :sunday => "日曜日",
                :monday => "月曜日",
                :tuesday => "火曜日",
                :wednesday => "水曜日",
                :thursday => "木曜日",
                :friday => "金曜日", 
                :saturday => "土曜日",
            }
  #p wday[ :saturday]

#2.[1]のデータ数の7を取得するコードを記載せよ
  #p wday.length

#3.eachメソッドを使用し[1]のハッシュから下記結果を取得せよ
#英語[sunday]は日本語で日曜日です。
#〜(一週間分)
  #wday.each{|enwd, jawd| puts "英語[#{enwd}]は日本語で#{jawd}です。"}

#問4.
#1.1個のさいころを振って出た目を返すメソッドdiceを作成せよ
  def dice
    #dice = [*1..6].sample(1)
    dice = rand(1..6)
  end
  
  #p dice()

#2.10個のさいころを振って出た目の合計値を返すメソッドdice10を作成せよ
  def dice10
    num = 0
    sum = 0
    
    for i in 1..10
      num = dice()
      sum = sum + num
      #print i, "回目[", "サイコロの目：", num, " /合計：", sum, "]\n"
      num = 0
    end
    
    return sum
  end

  #print "合計：", dice10(), "\n"
  