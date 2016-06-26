# coding: utf-8
# 課題8

require './poker.rb'


class Main
  @poker = nil # ゲーム管理オブジェクト
  
  def initialize
    @poker = Poker.new
    
    run
  end

  # ゲームを実行
  def run
    @poker.get_role
    loop do
      print ">> "
      i = $stdin.gets.chomp
      if /^[0-2]$/ === i
        res = game.run(i)
        p res
        next
      elsif i == "end"
        game.result
        return
      else
        puts "0, 1, 2, end のどれかしか受け付けないよ！"
      end
    end

  end
  
end


