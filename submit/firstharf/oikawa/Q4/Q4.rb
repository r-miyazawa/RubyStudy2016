#Q1
print "##Q1##\n\n"

def dice()
    dice = rand(6)+1
end

print "サイコロを１個振る\n"
print dice(),"\n"



#Q2
print "\n##Q2##\n\n"

def dice10()
    sum = 0

    10.times{|i|
        n = dice()
        sum += n
        print i+1, "個目", n, "\n"
    }

    sum
    
end

print "10個のサイコロを振って出た目の合計を足す\n"
print "合計：", dice10(), "\n"



print "\n##Q3##\n\n"

def bmi(height,weight)
    bmi = weight / (height * height)
end

print "BMIを出す\n"
print "身長1.6M、体重50KG\n"
printf("%.3f\n",bmi(1.6,50))




#Q4
print "\n##Q4##\n\n"

def prime_judge(num)
    i = 2

    while i < num
        if num % i == 0
            break
        end 
        i = i + 1
    end

    if num == i
        print true,"\n"
    elsif
        print false,"\n"
    end
end

print "素数であればtrue、でなければfalse\n"
prime_judge(40)
prime_judge(11)
