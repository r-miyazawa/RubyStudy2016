=begin

課題22

次のサイトより、クローリングにより表示している記事のリンクページから記事のタイトル・本文・記事のリンクを出力せよ。

http://news.yahoo.co.jp/topics

【参考】
http://anemone.rubyforge.org/
http://www.nokogiri.org/

【コード条件】
•anemoneライブラリを使用すること
•スタイルガイドに沿って作成すること
•クラス・メソッドの使用を考えること

=end

require 'anemone'

url = "http://news.yahoo.co.jp/topics"
opts = {
  :skip_query_strings => true,
  :depth_limit => 1,
}

Anemone.crawl(url, opts) do |anemone|
  anemone.on_every_page do |page|
    puts page.urlfffffffff
  end
end