=begin
【仕様】

繰り返し処理：
ジャンケンゲームでユーザにカード（0:グー、1:チョキ、2:パー、end:ゲーム終了）
を選択させコンピュータと対戦。
「自分の手：相手の手：勝ち負けあいこの結果」　を表示。

end:終了コマンドで「ゲーム数：勝数：負数：引き分け数」を表示。

【機能】
•入力検証は行うこと（文字チェック、選択キー以外なものなど）

【コード条件】
•クラス・メソッドの使用を検討すること
=end

class Player
    attr_accessor :option
    protected :option=
    @option
    
    def initialize
        STDOUT.flush
        op = gets.chomp
        @option = op.scan /\w/
        check
    end
    def check
        if @option.size === 1
            case @option[0].to_i
            when 0
                @option = 0
            when 1
                @option = 1
            when 2
                @option = 2
            else
                puts "「0」「1」「2」「end」だけ記入しください"
                initialize
            end
        elsif @option.size ===3
            op = @option.join()
            if op.eql?"end"
                @option = nil
            else
                puts "「0」「1」「2」「end」だけ記入しください"
                initialize
            end
        else
            puts "「0」「1」「2」「end」だけ記入しください"
            initialize
        end
    end
end

class Pc
    attr_accessor :ran, :obj
    protected :ran=, :obj=
    
    def initialize
        @ran = rand(3)
        @obj = ["グー","チョキ","パー"]
    end
    def compare(option)
        puts "自分の手：#{@obj[option]}  相手の手：#{@obj[ran]}"
        if option === ran
            return 0
        elsif option === 0 and ran ===1
            return 1
        elsif option === 1 and ran ===2
            return 1
        elsif option === 2 and ran === 0
            return 1
        else
            return -1
        end
    end
end

class Game
    @lose
    @win
    @draw
    @game
    
    def initialize
        @lose = 0
        @win = 0
        @draw = 0
        @game = 0
    end
    
    def start
        puts "ジャンケンゲーム"
        puts "0:グー、1:チョキ、2:パー、end:終了"
        
        pc = Pc.new     
        player = Player.new
        
        if player.option.nil?
            puts "ゲーム数：#{@game}、勝数：#{@win}、負数：#{@lose}、ドロー：#{@draw}"
            exit
        end
        
        res = pc.compare(player.option)
        
        @game += 1
        
        if res === 0
            @draw += 1
            puts "ドロー"
        elsif res === 1
            @win += 1
            puts "勝ち"
        else
            @lose += 1
            puts "負け"
        end
        
        check
    end
    def check
        start
    end
end

game = Game.new
game.start