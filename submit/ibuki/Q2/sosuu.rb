require 'benchmark'

def prime_number?(n)
  if n < 2
    return false
  elsif n == 2
    return true
  end

  (2..n-1).each do |x|
    return false if n % x == 0
  end

  return true
end

result = Benchmark.realtime do
  limit = ARGV[0].to_i

  (2..limit).each do |n|
    p n if prime_number?(n)
  end
end



def generate_prime_numbers(n)
  numbers = (2..n).to_a
  limit = Math.sqrt(n)
  prime_numbers = []

  while numbers[0] < limit
    prime_numbers << numbers.shift

    numbers.each do |i|
      numbers.delete(i) if i % prime_numbers.last == 0
    end
  end

  prime_numbers.concat(numbers)

  prime_numbers
end

n = 100
result = Benchmark.realtime do
  prime_numbers = generate_prime_numbers(n)
  p prime_numbers
end


