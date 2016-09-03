# coding: utf-8
# 3.bmiを求めるメソッドを作成せよ
#   bmi : 体重 / (身長(m) * 身長(m))

def calcBmi(weight, height)
  return weight / (height*height)
end

p calcBmi(60, 1.7)
