module M1
	def meth
		"M1#meth"
	end
end

module M2
	def meth
		"M2#meth"
	end
end

class C
	include M1 # モジュール M1 をインクルードする。
	include M2 # モジュール M2 をインクルードする。

end

p C.ancestors #=> [C, M2, M1, object, Kernel]