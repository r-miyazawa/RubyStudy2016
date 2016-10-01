def prime (num)
  for i in 2..num
    x = i
    x -= 1
    while !(i % x == 0)
      x -= 1
    end
    if x == 1
      puts i
    end
  end
end

prime(100)