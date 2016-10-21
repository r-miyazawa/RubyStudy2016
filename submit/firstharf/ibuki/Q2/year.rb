def isLeapYear(year) #判定
  return false if year < 4

  year % 400 == 0 || (year % 100 != 0 && year % 4 == 0) 
end



isLeapYear


 print("数値を入力")
 a = gets.chomp.to_i
 
 print("数値を入力")
 b = gets.chomp.to_i
