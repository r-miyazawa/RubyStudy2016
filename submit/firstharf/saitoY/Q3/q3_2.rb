def uru(i)
  if (i%4==0&&i%100!=0)||(i%4==0&&i%100==0&&i%400==0)
    puts i
  end
end

for i in 0..2014
  uru(i)
end