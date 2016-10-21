# coding: utf-8
# 1. 1〜100までの間で素数を表示させよ
# 　※メソッドを作成しコールする事

require 'prime'

class MyPrime
  @range
  @primes
  @truthprimes # rubyのPrimeクラスを使用した素数を格納

  def initialize(num)
    @range = num
    @primes = []

    @truthprimes = []
  end
  
  def judgePrimes
    @range.times do |num|
      # 例外処理
      if num === 1
        next
      elsif num === 2 || num === 3
        #p num
        @primes.push(num)
        
        next
      end
      
      if num % 2 != 0 && num % 3 != 0
        #p num
        @primes.push(num)
      end
    end
  end

  def judgeTruthPrimes
    p @truthprimes = Prime.each(@range).to_a
  end

  # 2と3の素数を表示
  def showPrimes
    p @primes
  end

  def showTruthPrimes
    p @truthprimes
  end

  # 真実を表示
  def showTheTruth
    p @primes - @truthprimes
  end
  
end

pr = MyPrime.new(100)
pr.judgePrimes()
pr.showPrimes()

puts "=== 以下 Prime Class を使用 === "
pr.judgeTruthPrimes()
pr.showTruthPrimes()

puts "=== Primeクラスとの差 ==="
pr.showTheTruth()# [25, 35, 49, 55, 65, 77, 85, 91, 95]
