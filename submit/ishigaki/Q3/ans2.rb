2014.times do |i|
	flg=1
	if(i % 4 == 0)
		if(i % 100 == 0)
			if(i % 400 == 0)
				flg=0
			end
		else
			flg=0
		end
	end
	if(flg==0)
		puts("#{i}年は閏年")
	end
end
