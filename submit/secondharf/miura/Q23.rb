=begin
課題23

次のサイトより、クローリング(Anemone)により表示している映画カテゴリのリンクページ以下の情報を取得して出力せよ。
※Anemoneのストレージはpstoreを指定すること

出力情報：
映画タイトル
監督
演者
ジャンル
映画メイン画像url
詳細リンクurl

http://store-tsutaya.tsite.jp/item.html

【参考】
http://anemone.rubyforge.org/
http://www.nokogiri.org/

【コード条件】
•anemoneライブラリを使用すること
•スタイルガイドに沿って作成すること
•クラス・メソッドの使用を考えること
=end

require "anemone"

url = "http://store-tsutaya.tsite.jp/item.html"
opts = {
  :storage => Anemone::Storage::PStore('movies.db'),
  :obey_robots_txt => true,
  :depth_limit => 1,
  :skip_query_strings => false
}

Anemone.crawl(url,opts) do |anemone|
		anemone.focus_crawl do |page|
	    	page.links.keep_if { |link|
	      		link.to_s =~ /search_result.html/
	    	}
  		end

       anemone.on_every_page do |page|
               if page.url.to_s.match(/211&ic=002&it=0000&lj=/)
               		puts "映画タイトル：#{page.doc.xpath('//*[@id="pbBlock6564100"]/div/div[2]/div[4]/div[1]/div[2]/dl/dt/a').text}"
                  #puts "映画メイン画像url：#{page.doc.xpath('')}"
                  #puts "詳細リンクurl：#{page.doc.xpath('')}"
               		puts page.url
               		puts "\n"
               end
       end
end