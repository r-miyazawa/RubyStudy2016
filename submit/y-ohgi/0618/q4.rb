# coding: utf-8
# 問4.
# 1.1個のさいころを振って出た目を返すメソッドdiceを作成せよ
# 2.10個のさいころを振って出た目の合計値を返すメソッドdice10を作成せよ

# 1 から渡された数値num までの数値をランダムで返す
def dice(num=6)
  # 数値型であり、0より大きい値出ない場合は例外
  if num.kind_of?(Integer) && 0 >= num
    throw :err
  end
  
  return rand(num) + 1
end

# サイコロ10個を降って出た目を合計し、その数値を返す
def dice10
  result = 0

  10.times do
    result += dice
  end
  
  return result
end
