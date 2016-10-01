#Q1
print "Q1\n"
def prime()
    n = 2
    while n <= 100
        i = 2
        while i < n
            if n % i == 0
                break
            end 
            i = i + 1
        end
        if n == i
            print n, "\n"
        end
        n = n + 1
    end
end

prime()

#Q2
print "\n\nQ2\n"
def leap_year()
    x = 0
    while x <= 2014
        if (x % 400 == 0 || (x % 4 == 0 && x % 100 != 0))
            print x, "\n"
        end
        x = x + 1
    end
end

leap_year()


#Q3
