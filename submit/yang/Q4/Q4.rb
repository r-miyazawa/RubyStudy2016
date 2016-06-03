print "1.\n\n"

def dice(n)


	i=1;
	sum = 0;
	while i<=n
		x = rand(1...6);
		sum = sum + x;
		i = i+1;
		
	end
	
	print sum
	

end

dice(1);

print "\n------------------------------------\n"
print "2.\n\n"



print "total=";
dice(10);

print "\n------------------------------------\n"
print "3.\n\n"

def bmi(w,h)

	a = w/(h*h);
	
	print "BMI=",a;

end

bmi(60.0,1.70);

print "\n------------------------------------\n"
print "4.\n\n"

def sos(x)

	i=1;
	t=0;
	while i<=x
		if(x%i == 0) then
			t = t+1;
		else
			t = t;
		end
		
		i = i+1;
	end
	
	p (t == 2);

end

sos(17); 