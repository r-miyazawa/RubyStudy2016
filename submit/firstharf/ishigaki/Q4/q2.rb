def dice10()
	ans = 0
	10.times do
		ans += rand(6)+1
	end
	return ans
end

print(dice10())