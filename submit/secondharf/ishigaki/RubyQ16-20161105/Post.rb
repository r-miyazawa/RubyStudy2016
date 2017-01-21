require 'active_record'

ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./test.db"
)

class Post < ActiveRecord::Base
end

STDOUT.sync = true
puts "どの操作を実行しますか？"
puts "[1.レコード参照 / 2.レコード新規作成 / 3.レコード変更 / 4.レコード削除]"
select = gets.to_i

case select
when 1 then
	datas = Post.all
	if !datas.empty? then
		for row in datas do
			puts ("[id]#{row.id}[title]#{row.title}[message]#{row.message}")
		end
	else
		puts "レコードがありません"
	end
when 2 then
	print "titleを入力してください："
	title = gets.chop
	print "messageを入力してください："
	msg = gets.chop
	if !title.empty? && !msg.empty? then
		begin
			post = Post.new(:title => title, :message => msg)
			puts "DB insert Success"
		rescue ActuveRecord::RecordNotSaved => e
			puts "DB Insert ERROR"
		end
	else
		puts "どちらかが空です"
	end
when 3 then
	print "IDを入力してください："
	id = gets.to_i
	begin
		post = Post.find(id)
		print "titleを入力してください："
		title = gets.chop
		print "messageを入力してください："
		msg = gets.chop
		post.update_attributes(:title => title, :message => msg)
		puts "DB Update Success"
	rescue ActiveRecord::RecordNotSaved => e
		puts "DB Update ERROR"
	rescue ActiveRecord::RecordNotFound => e
		puts "指定したIDがありません"
	end
when 4 then
	print "IDを入力してください："
	id = gets.to_i
	begin
		post = Post.find(id)
		post.delete
		puts "DB Delte Success"
	rescue ActiveRecord::RecordNotSaved => e
		puts "DB Delete ERROR"
	rescue ActiveRecord::RecordNotFound => e
		puts "指定したIDがありません"
	end
else
	puts "1~4を入力してください"
end