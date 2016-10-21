print "1.\n\n"

def sosuu
  a=0
  i=2
  while i <= 100
    j=1
    a=0
    while j <= i
      if i%j == 0
        a = a+1
      end
        j = j+1
    end
    if a == 2
      print i, ", "
    end
    i=i+1
  end
end

sosuu()


print "\n-------------------------------------------\n"
print "2.\n\n"

def tosi
  n=0
  t=0
  while n <= 2014
    if n % 400 == 0
      print n, ", "
      n = n+1
      t = t+1
    elsif n % 100 == 0
      n = n+1
    elsif n % 4 == 0
      print n, ", "
      n = n+1
      t = t+1
    else
      n = n+1
    end
  end
  print "\n\ntotle = ", t
end

tosi()


print "\n-------------------------------------------\n"
print "3.\n\n"


def magic(a)

  magic = Array.new(a){Array.new(a)}

  i=a/2
  j=a-1
  n=1

  while n < a*a
    magic[i][j] = n
    tempi = i
    tempj = j
    i = i-1
    j = j+1
    if i < 0
      i = a-1
    else
      i = i
    end
    if j == a
      j = 0
    else
      j = j
    end

    n = n+1
    if magic[i][j] != nil
      i = tempi
      j = tempj
      j = j-1

      if j < 0
        j = a-1
      else
        j = j
      end
      magic[i][j] = n
    else
      magic[i][j] = n
    end

  
  end


  num = 0
  while num < a
    print magic[num], "\n"
    num = num + 1
  end

end

magic(5)