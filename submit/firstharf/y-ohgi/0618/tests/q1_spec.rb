# coding: utf-8
dir =  __dir__+"/"
require 'test/unit'
require dir+'../q1.rb'

class TestQ1 < Test::Unit::TestCase
  
  sub_test_case "1〜100までの整数が昇順に並ぶ配列aを作成せよ" do
    test "" do
      one2hundred_ary = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100]
      startnum = 1
      endnum = 100

      a = makeNumAry(startnum, endnum)
      
      assert_equal one2hundred_ary, a
    end
  end

  sub_test_case "[1]の配列の各要素を100倍した、新しい配列bを作成せよ" do
    test "" do
      hundred2thousand_ary = [100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2300,2400,2500,2600,2700,2800,2900,3000,3100,3200,3300,3400,3500,3600,3700,3800,3900,4000,4100,4200,4300,4400,4500,4600,4700,4800,4900,5000,5100,5200,5300,5400,5500,5600,5700,5800,5900,6000,6100,6200,6300,6400,6500,6600,6700,6800,6900,7000,7100,7200,7300,7400,7500,7600,7700,7800,7900,8000,8100,8200,8300,8400,8500,8600,8700,8800,8900,9000,9100,9200,9300,9400,9500,9600,9700,9800,9900,10000]
      startnum = 1
      endnum = 100
      a = makeNumAry(startnum, endnum)

      b = doHundredfoldNumAry(a)

      assert_equal hundred2thousand_ary, b
    end
  end

  sub_test_case "[1]の配列の各要素から3の倍数のみ取得した、新しい配列cを作成せよ" do
    test "" do
      multiplesOf3_ary = [3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69,72,75,78,81,84,87,90,93,96,99]
      startnum = 1
      endnum = 100
      a = makeNumAry(startnum, endnum)
      b = getTrebleNumAry(a)
      
      assert_equal multiplesOf3_ary, b
    end
  end

  sub_test_case "[1]の配列を逆順に並び替えせよ" do
    test "" do
      reverse_ary = [100,99,98,97,96,95,94,93,92,91,90,89,88,87,86,85,84,83,82,81,80,79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]
      startnum = 1
      endnum = 100
      a = makeNumAry(startnum, endnum)
      b = reverseNumAry(a)
      
      assert_equal reverse_ary, b
    end
  end

  sub_test_case "[1]の配列に含まれる整数の和を求めよ" do
    test "" do
      addednum = 5050
      startnum = 1
      endnum = 100
      a = makeNumAry(startnum, endnum)
      b = addNumAry(a)
      
      assert_equal addednum, b
    end
  end

  sub_test_case "数値からなる配列array1と配列array2のそれらの個々の要素を足し合わせた結果を配列で返すsum_arrayメソッドを作成せよ" do
    # 実行例）p sum_array([1,2,3],[4,5,6]) # 出力: [5,7,9]
    test "" do
      addedary = [5,7,9]
      a = sum_array([1,2,3], [4,5,6])
      
      assert_equal addedary, a
    end
  end

end
