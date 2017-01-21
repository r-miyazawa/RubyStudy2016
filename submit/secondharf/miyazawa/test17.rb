require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./accounts.sql"
)

class Account < ActiveRecord::Base
end

puts "どの操作を実行しますか？(1,2,3,4を入力)\n
[1.レコード参照 / 2.レコード新規作成 / 3.レコード変更 / 4.レコード削除]"
num = gets.chomp.to_i

if num == 1
  #puts "01"
  Account.all
elsif  num == 2
  #puts "02"
  #puts "入力してください"
hoge = Account.new
hoge.title = "title1"
hoge.message = "message1"
hoge.seve
Account.create(:title=>"title1",:message=>"message")


elsif num == 3
  puts "IDを入力してください"
  id = gets.chomp.to_i
  puts id
elsif num == 4
  puts "IDを入力してください"
  id = gets.chomp.to_i
  id = [Account].find([index])
  id = delete
else
  puts "NG"
end
