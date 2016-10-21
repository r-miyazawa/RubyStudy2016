def prime(val)
	count=0
	flg=0
	j=2
	
	if val == 1
		flg=1
	else
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
	end
	return flg
end

STDOUT.sync = true

puts "数値の入力"
val = gets.to_i
print prime(val)