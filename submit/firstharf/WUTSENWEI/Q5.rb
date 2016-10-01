class HitAndBlow
  @@count = 0
  
  def HitAndBlow.count
    @@count
  end
  
  def initialize(ans=1,num=1)
    @ans = ans
    @num = num
  end
  
  def hab
    @@count += 1
    
    hit = 0
    blow = 0

    nxx = @num/100
    xnx = (@num%100)/10
    xxn = (@num%100)%10
  
    nxxA = @ans/100
    xnxA = (@ans%100)/10
    xxnA = (@ans%100)%10



    if(nxx == nxxA) then
      hit = hit + 1
    elsif(nxx == xnxA) then
	  blow = blow + 1
    elsif(nxx == xxnA) then
      blow = blow + 1
    else
      hit = hit
      blow = blow
    end
  
    if(xnx == nxxA) then
	  blow = blow + 1
    elsif(xnx == xnxA) then
	  hit = hit + 1
    elsif(xnx == xxnA) then
      blow = blow + 1
    else
      hit = hit
      blow = blow
    end
  
    if(xxn == nxxA) then
	  blow = blow + 1
    elsif(xxn == xnxA) then
	  blow = blow + 1
    elsif(xxn == xxnA) then
      hit = hit + 1
    else
      hit = hit
      blow = blow
    end
    
    print "hit: ",hit,",blow: ",blow,"\n"
    
    end
  end

num = rand(100...999)

while(1)
  nxx = num/100
  xnx = (num%100)/10
  xxn = (num%100)%10

  if(nxx == xnx || nxx == xxn || xnx == xxn) then
    num = rand(100...999)
  else
    break;
  end
end

ans = gets

while(1)

  while(1)
  
  
    if(ans.to_i > 999 || ans.to_i < 100) then
      puts "error"
      break;
    end

    nxxA = ans.to_i/100
    xnxA = (ans.to_i%100)/10
    xxnA = (ans.to_i%100)%10
  
    if(nxxA == xnxA || nxxA == xxnA || xnxA == xxnA) then
      puts "error"
      ans = gets
    else
      break;
    end
  end

  
  temp = HitAndBlow.new(ans.to_i,num)

  temp.hab
  
  ans = gets
 
  if(ans.to_i == 0) then
    break;
  end
end

  print "ans:",num,"\n"

print "total=",HitAndBlow.count," times."