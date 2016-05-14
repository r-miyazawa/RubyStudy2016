# coding: utf-8
# 4.素数かどうかを真偽値で返すメソッドを作成せよ

def isPrime(num)
  res = true

  num.times do |n|
    if n === 0 || n === 1
      next
    end

    if num % n === 0
      res = false
    end
    
  end

  return res
end
