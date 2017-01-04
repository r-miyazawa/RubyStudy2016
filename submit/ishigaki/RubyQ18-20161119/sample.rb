# encoding: utf-8
require 'open-uri'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./article.db"
)

class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :article, presence: true
  validates :img, presence: true
  validates :time, presence: true
end
page = open("http://jp.reuters.com/article/feifer-putin-idJPKBN13D0PK", &:read)

title = page.scan(/<h1.*?>(.*)<.*>/)
title = title[0][0]
text = page.scan(/<span class="focusParagraph">(.*)<\/span>/)
article = text[0][0]
article.gsub!(/<\/?[^>]*>/, "")
time = page.scan(/<span.*?>(.*)年(.*)月(.*)日(.*)JST<\/span>/)
day = "#{time[0][0]}-#{time[0][1]}-#{time[0][2]}-#{time[0][3]}"
day.gsub!(" ", "")
img = page.scan(/<link rel="image_src" href="(.*)"/)
img = img[0][0]

data = {
	:title => '',
	:article => '',
	:img => '',
	:time => ''
}
data[:title] = title
data[:article] = article
data[:img] = img
data[:time] = day

atcl = Article.new(data)
atcl.save