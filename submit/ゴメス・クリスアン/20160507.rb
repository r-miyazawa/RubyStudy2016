### 問題１

def prime
    (1...100).each do |num|
        count = 0
        (1...num).each do |div|
            if num % div ==0
                count += 1
            end
        end
        unless count>2
            print "素数 " , num , "\n"
        end
    end
end

prime()

### 問題２

class Years
    def leapYear
        (0...2014).each do |year|
            if year % 4 == 0
                puts "#{year}は閏年です。\n"
            elsif year % 100 != 0 and year % 400 == 0
                puts year, "#{year}は閏年です。\n"
            end
        end
    end
end

yearLeap = Years.new

yearLeap.leapYear