class MagicSquare
	#入力していく数値
	@@val = 1
	def initialize(len)
		@ary = Array.new(len){ Array.new(len) }
		@ary[@ary.length-1][@ary.length/2] = @@val
	end
	
	#初期位置以外からの処理
	def setObj()
		i=j=0
		#配列すべての要素数
		filed=@ary.length**2-1
		
		here = Hash["x" => 0, "y" => 0]
		here["x"] = @ary.length-1
		here["y"] = @ary.length/2
		
		filed.times do
			#配列の外に出ていないかのチェック
			if here["x"]+1 != @ary.length
				here["x"] += 1
			else
				here["x"] = 0
			end
			
			if here["y"]-1 >= 0
				here["y"] -= 1
			else
				here["y"] = @ary.length-1
			end
			
			#もし値が入っていた時のx-1の処理
			if @ary[here["x"]][here["y"]]
				if here["x"]-1 >= 0
					here["x"] -= 1
				end
			end
			
			#代入
			@@val += 1
			@ary[here["x"]][here["y"]] = @@val
		end
	end
	
	#配列を見る
	def showAry()
		p @ary
	end
end

#配列の数
len=3
puts("配列の数:#{len}")
obj = MagicSquare.new(len)
obj.setObj()
obj.showAry()
