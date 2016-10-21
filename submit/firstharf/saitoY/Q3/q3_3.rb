def move(num, now)
  num -= 1
  now[0] += 1
  if (now[0]>num)
    now[0] = 0
  end
  now[1] -= 1
  if (now[1]<0)
    now[1] = num
  end
end

num = 3
now = Array.new(2)
now[0] = num
now[1] = num / 2 + 1
square = Array.new(num, 0).map{Array.new(num, 0)}
for i in 1..num*num
  square[now[0]][now[1]] = i#エラーになる理由がわからない
  move(num, now)
end

require "pp"
pp square