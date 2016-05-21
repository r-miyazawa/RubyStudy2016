# coding: utf-8
# 3. 3 * 3の魔法陣プログラムを完成させよ
# ------------------------------------------------
#   【処理】
# 1の位置は右列の中央に設定すること
# 現位置から横+1 縦+1の位置に次の数値を設定する
# - 値が既にある場合は現位置から横-1
# - 枠を超える場合：
# 　横の場合：右超えは左に続く
# 　縦の場合：上超えは下に続く

# 【コード条件】
# •クラス・メソッドの使用を考えること
# •汎用的なコードとすること
# 　※5 * 5を一カ所変更することで表示できる作りとすること
# ------------------------------------------------

class MagicSquare
  @size = 0
  @square = []
  @magicflg = true
  
  def initialize(size)
    if size % 2 === 0
      # XXX:インスタンスが自殺して欲しいけど調べられなかった
      puts "偶数の魔法陣は作れないよ！"
      @magicflg = false
    else
      puts size.to_s + ":" + size.to_s + "の魔法陣を作るよ！"
    end

    @size = size
    @square = Array.new(size){Array.new(size, 0)}
  end
  

  # 現在の魔法陣を見る
  def showSquare
    if @magicflg === false
      puts "魔法陣作ってません！"
      return
    end
    
    @square.each do |sq|
      line = ""
      sq.each do |num|
        line += format("%02d", num) + " "
      end
      puts line
    end
  end

  
  # 魔法陣をすすめる
  def startMagic
    if @magicflg === false
      puts "作れません！"
      return
    end
    
    stnum = 1
    stcol = @size/2
    stline = @square.length-1

    (@size * @size).times do |col|
    #4.times do |col|
      if stnum === 1
        @square[stcol][stline] = stnum
      else
        tmpcol = stcol
        tmpline = stline

        if (tmpcol -= 1) < 0
          tmpcol = @size-1
        end
        if (tmpline += 1) >= @size
          tmpline = 0
        end

        if @square[tmpcol][tmpline] === 0
          @square[tmpcol][tmpline] = stnum
          stcol = tmpcol
          stline = tmpline
        else
          @square[stcol][stline-1] = stnum
          stcol = stcol
          stline = stline-1
        end
        
      end # if stnum === 1

      stnum += 1
    end
  end
  
end

ms = MagicSquare.new(3)
ms.startMagic()
ms.showSquare()
#=> 3:3の魔法陣を作るよ！
#=> 02 07 06 
#=> 09 05 01 
#=> 04 03 08

puts ""
hoge = MagicSquare.new(5)
hoge.startMagic()
hoge.showSquare()
puts ""
hoge = MagicSquare.new(9)
hoge.startMagic()
hoge.showSquare()
puts ""
hoge = MagicSquare.new(10)
hoge.startMagic()
hoge.showSquare()
