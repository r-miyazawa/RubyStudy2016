require 'rubygems'
require 'active_record'

class Main
  SHOW_ALL = "1"
  CREATE_RECORD = "2"
  CHANGE_RECORD = "3"
  DELETE_RECORD = "4"
  
  # 処理の実行
  def self.run
    choices = '1.レコード参照 / 2.レコード新規作成 / 3.レコード変更 / 4.レコード削除 / exit. 終了'
    choices_reg = /[1-4]{1}/
    
    begin
      while true
        case question(choices, choices_reg)
        when SHOW_ALL then
          show_posts
        when CREATE_RECORD then
          puts create_post
        when CHANGE_RECORD then
          puts change_post
        when DELETE_RECORD then
          puts delete_post
        end
      end
    rescue => e
      puts "終了"
      return false
    end
    
  end

  private
  # レコード一覧
  def self.show_posts
    posts = Post.all

    if posts
      posts.each do |post|
        puts post.id
        puts post.title
        puts post.message
        puts "----------"
      end
    else
      puts "存在しない"
    end
  end
  
  # レコード新規作成
  def self.create_post
    title_text = "タイトルを入力してください"
    title_reg = /\w{1,50}/
    message_text = "メッセージを入力してください"
    message_reg = /\w{1,150}/

    title_input = question(title_text, title_reg)
    message_input = question(message_text, message_reg)

    post = Post.create(
      title: title_input,
      message: message_input
    )

    if post
      "作成完了"
    else
      "作成失敗"
    end
  end
  
  # レコード変更
  def self.change_post
    # TODO: 共通化
    title_text = "タイトルを入力してください"
    title_reg = /\w{1,50}/
    message_text = "メッセージを入力してください"
    message_reg = /\w{1,150}/
    

    if post.present?
      title_input = question(title_text, title_reg)
      message_input = question(message_text, message_reg)

      if post.update
        "変更完了"
      else
        "変更失敗"
      end
    else
      "存在しないレコード"
    end
  end
  
  # レコード削除
  def self.delete_post
    if post.destroy
      "削除完了"
    else
      "存在しない"
    end
  end
  

  # 一件取得
  def self.post
    @post || set_post
  end
  # postの設定
  def self.set_post
    begin
      @post = Post.find( question("idを入力してください", /\A[0-9]+\z/) )
    rescue
      @post = Post.none
    end
  end
  
  
  # ユーザーへの質問
  # @param {String} text 質問文
  # @param {Regexp} regexp バリデーション用正規表現
  def self.question(text, regexp)
    input = input_request(text)
    return input if validate(input, regexp)
    puts "不正な値です"
    question(text, regexp)
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
  
  # 検証メソッド
  # @param {String} text 検証するテキスト
  # @param {Regexp} regexp 正規表現
  def self.validate(text, regexp)
    text =~ regexp
  end
end

# db接続設定
ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     "localhost",
  username: "root",
  password: "",
  database: "school",
)
# テーブルの定義
class Post < ActiveRecord::Base
  self.table_name = "posts"
end

# スクリプトの実行
Main.run()

# CREATE TABLE `posts` (
#   `id` int(11) NOT NULL AUTO_INCREMENT,
#   `title` varchar(255),
#   `message` text,
#   `created_at` datetime,
#   `updated_at` datetime,
#   PRIMARY KEY (`id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8

