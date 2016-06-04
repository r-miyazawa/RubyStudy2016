def make_num
	#数字生成
	(0..9).to_a.sample(3)
end

def c_hit(a, ans)
	hit = 0
	3.times  do |i|
		if ans[i] == a[i]
			hit+=1
		else
			next
		end
	end
	return hit
end

def c_blow(a, ans)
	blow = 0
	3.times  do |i|
		if ans.include?(a[i])
			blow+=1
		else
			next
		end
	end
	return blow
end

ans = make_num

a = Array.new(3,0)

3.times do |i|
a[i] = gets.to_i
end

hit = c_hit(a, ans)
blow = c_blow(a, ans)

if hit == 3
	p "正解です"
else
	#hit/blow表示
	p "hit#{hit} blow#{blow}"
end
p a
p ans