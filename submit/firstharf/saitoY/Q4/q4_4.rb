def prime(x)
  for i in 2..x-1
    if(x%i==0)
      return false
    end
  end
  return true
end

puts "素数であるかどうか調べたい整数を入力"
puts prime(gets.chomp.to_i)