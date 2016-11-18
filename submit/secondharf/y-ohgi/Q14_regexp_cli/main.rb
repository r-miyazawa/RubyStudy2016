class Main
  
  # 処理の実行
  def self.run(items)
    answers = []
    begin
      items.each do |item|
        answers << {
          name: item[:name],
          input: question(item)
        }
      end
    rescue => e
      puts "終了"
      return false
    end

    # 結果の表示
    answers.each{|a| puts "#{a[:name]} : #{a[:input]}"}
  end

  private
  # ユーザーへの質問
  # @param {Hash} item 質問の詳細 {name: , text: ,  regexp: }
  def self.question(item)
    text = input_request(item[:text])
    return text if validate(text, item[:regexp])
    puts item[:invalid] || "不正な値です"
    question(item)
  end

  # 検証メソッド
  # @param {String} text 検証するテキスト
  # @param {Regexp} regexp 正規表現
  def self.validate(text, regexp)
    text =~ regexp
  end

  # ユーザーへ文字入力の要求を行う
  # @params {String} 出力させるテキスト
  # @return {ユーザーが入力を行ったテキスト}
  def self.input_request(text)
    puts text
    print ">> "
    i = $stdin.gets.chomp
    raise "got exit" if i  == "exit"
    i
  end
  
end

user = [
  {
    name: "ユーザー名",
    text: "ユーザー名を入力してください",
    invalid: "@から始まる3文字以上の半角英大文字のみ許容",
    regexp: /\A@[A-Z]{3,}\z/
  },
  {
    name: "電話番号",
    text: "電話番号を入力してください",
    #regexp: /\A[0-9]{3,}-([0-9]{4,}\z|\A[0-9]{3,})-[0-9]{4,}\z/
    regexp: /\A([0-9]{3,})-([0-9]{4,})-([0-9]{4,})|([0-9]{4,})-([0-9]{3,})-([0-9]{3,})|([0-9]{3,})-([0-9]{3,})-([0-9]{4,})\z/
  },
  {
    name: "郵便番号",
    text: "郵便番号を入力してください",
    regexp: /\A[0-9]{7}\z|\A[0-9]{3}-[0-9]{4}\z/
  },
  {
    name: "メールアドレス",
    text: "メールアドレスを入力してください",
    regexp: /\A([\w+-_.!$#%])+@([\w+-_.!$#%])+\.([\w+-_.!$#%])+\z/
  }
]
Main.run(user)
