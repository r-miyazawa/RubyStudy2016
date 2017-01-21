require 'open-uri'
require 'nokogiri'
require 'active_record'
require 'sqlite3'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

doc = Nokogiri::HTML(open("http://jp.reuters.com/article/bazzi-hatecrimes-idJPKBN13K15O?sp=true",&:read))

title = nil
create_article = nil
img = nil
content = nil
doc.xpath('//section[@class="main-content"]').each do |node|
	title = node.xpath('//h1[@class="article-headline"]').text
	create_article = node.xpath('//span[@class="timestamp"]').text
	img = node.xpath('//div[@class="module-slide-media"]/img').attribute("data-lazy").value
	content = node.xpath('//span[@id="articleText"]/p').text
end

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./test.db"
)

class Article < ActiveRecord::Base
end

data = {
	:title => '',
	:content => '',
	:img => '',
	:create_article => ''
}

data[:title] = title
data[:content] = content
data[:img] = img
data[:create_article] = create_article

atcl = Article.new(data)
atcl.save