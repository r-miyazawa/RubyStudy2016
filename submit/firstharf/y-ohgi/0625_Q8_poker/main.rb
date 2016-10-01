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
    @poker.get_role(Player)
    phase = 0 # ゲームの進行度合いを格納
    
    loop do
      case phase
      when 0 then
        # カードを変更するかの確認
        puts "現在のハンドです"
        puts @poker.get_visualize_cards

        puts "カードを変更しますか？(yes|no)"
        print ">> "
        i = $stdin.gets.chomp
        if i === "yes"
          phase = 1
        elsif i === "no"
          phase = 2
        else
          puts "yes か no で入力してください"
        end
      when 1 then
      # カードを変更するかの確認
        puts "カードを変更する場所を指定してください(0|1|2|3|4)"
        puts " 入力例 '0,2,3'"
        print ">> "
        i = $stdin.gets.chomp
        nums = i.split(",")
        targets = []
        failflg = false

        p nums
        
        # 入力チェック
        nums.each do |n|
          if /^[0-9]$/ =~ n
            num = n.to_i
            targets << num
          else
            failflg = true
            break
          end
        end
        
        if failflg === true
          puts "入力エラーです、正しく入力して下さい"
        else
          targets.each do |target|
            @poker.change_card(target)
          end
          
          puts "現在のハンドです"
          puts @poker.get_visualize_cards
          
          phase = 2
        end
      when 2 then
        # reslt & ゲームを続けるかの確認
        puts ""
        puts "   --- RESLT ---"
        result = @poker.result
        puts "貴方のハンド"
        puts @poker.get_visualize_cards(Player)
        puts "役は： #{@poker.get_role(Player, true)}"
        puts ""
        puts "CPUのハンド"
        puts @poker.get_visualize_cards(Cpu)
        puts "役は： #{@poker.get_role(Cpu, true)}"
        puts ""

        if result[:result] === 0
          puts "あなたは勝ちました！"
        elsif result[:result] === 1
          puts "あなたは負けました！"
        else
          puts "引き分けです!"
        end
        puts "勝ち: #{result[:win_count]} | 負け: #{result[:lose_count]} | 引分け: #{result[:draw_count]}"

        phase = 10
        
      when 10
        puts "ゲームを続ける？(yes|no)"
        print ">> "
        i = $stdin.gets.chomp
        if i === "yes"
          @poker.goto_next_game
          phase = 0
        elsif i === "no"
          exit
        else
          puts "yes か no で入力してください"
        end
        
      else
        # 例外
        puts "エラー"
        break
      end

      
      # print ">> "
      # i = $stdin.gets.chomp
      # if /^[0-2]$/ === i
      #   res = game.run(i)
      #   # p res
      #   next
      # elsif i == "end"
      #   game.result
      #   return
      # else
      #   puts "0, 1, 2, end のどれかしか受け付けないよ！"
      # end
      
    end

  end
  
end


main = Main.new
main.run
