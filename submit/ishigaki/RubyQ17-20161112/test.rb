require 'active_record'
# encoding: utf-8

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./user.db"
)

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :add, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, length: { in: 6..20}
end

STDOUT.sync = true
puts "[登録人数を入れてください]"
len = gets.to_i
len.times do |i|
	data = {
	  :name => '',
	  :add => '',
	  :email => '',
	  :password => ''
	}
	puts "[#{i+1}人目のuser情報を登録してください]"
	print "名前："
	data[:name] = gets.chomp
	print "住所："
	data[:add] = gets.chomp
	print "メールアドレス："
	data[:email] = gets.chomp
	print "パスワード"
	data[:password] = gets.chomp
	usr = User.new(data)
	if !usr.save
	  p usr.errors.messages
	else
	  p "success"
	end
end


