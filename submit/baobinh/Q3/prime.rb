def prime?(num)
  # num > 0 check
  return false if num == 1
  (2..Math.sqrt(num)).each do |x|
    if num % x == 0
      return false
    end
  end
  true
end

(1..100).each do |n|
  puts n if prime?(n)
end