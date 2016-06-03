def prime(val)
	count=0
	flg=0
	j=2
	while j<val
		if(val % j != 0 && val != 1)
			count += 1
		else
			flg = 1
			break
		end
		
		if(flg == 1)
			break
		end
		
		j += 1
	end
	
	if(flg == 0 && val != 1)
		puts("#{val}は素数")
	end
end

i=1
while i<=100
	prime(i)
	i += 1
end
