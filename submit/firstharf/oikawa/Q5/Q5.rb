def integer?(str)
  Integer(str)
    true
rescue ArgumentError#,NoMethodError,NameError
  false
  puts "ERROR:整数を入力してください"
end

def length(n)
  if n.to_s.length == 3
    true
  else
    false
    puts "ERROR:3桁で入力してください"
  end
end

correct_answer = Array.new(3)
correct_answer[0] = rand(9)
correct_answer[1] = rand(9)
correct_answer[2] = rand(9)
answer = Array.new(3)
finish = 1
count = 0
hit = 0
blow = 0
reng1 = 0
reng2 = 0

#出題者が決定
#puts "正解を入力"
#print "first: "
#correct_answer[0] = gets.to_i
#print "second: "
#correct_answer[1] = gets.to_i
#print "third: "
#correct_answer[2] = gets.to_i

while !(finish == 0)

  count += 1
  print count, "回目\n"
  print "正解：", correct_answer, "\n"
  
  #回答者が答えるex123
  begin
    print "回答："
    pre_ans = gets.chomp
  end while !((length(pre_ans) == true) || (integer?(pre_ans) == true))# || (pre_ans.length == 3))
  reng3 = pre_ans
  answer[0] = reng3 / 100
  reng2 = reng3 % 100
  answer[1] = reng2 / 10
  reng1 = reng2 % 10
  answer[2] = reng1
  #print answer, "\n"
  
  
  #数と配列番号が一致
  for i in 0..2
    if (correct_answer[i]==answer[i])
      hit +=1
    end
  end
  
  #数のみ一致
    if ((correct_answer[0]==answer[0]) || (correct_answer[1]==answer[1]) || (correct_answer[2]==answer[2]))
      if ((correct_answer[0]==answer[1])||(correct_answer[0]==answer[2]))
        blow += 1
      end
      if ((correct_answer[1]==answer[0])||(correct_answer[1]==answer[2]))
        blow += 1
      end
      if ((correct_answer[2]==answer[0])||(correct_answer[2]==answer[1]))
        blow += 1
      end
    end
  
  print "[Hit:", hit, "blow:", blow, "]\n"  
  hit = 0
  blow = 0

  #続行判定、完全一致したのち終了する判定
  if !((correct_answer[0]==answer[0])&&(correct_answer[1]==answer[1])&&(correct_answer[2]==answer[2]))
    puts "続けますか？(終了:0)"
    continue = gets.to_i
    
    if continue == 0
      finish = continue
      print finish, "終了します\n"
    end
    
  elsif ((correct_answer[0]==answer[0])&&(correct_answer[1]==answer[1])&&(correct_answer[2]==answer[2]))
  
    puts "完全一致" 
    finish = 0
    print finish, "終了します\n"
    
  end

end