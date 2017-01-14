require 'anemone'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Anemone.crawl("https://tech-c2016.github.io/sample/hierarchy/main.html", :depth_limit => 2) do |anemone|
  	anemone.focus_crawl do |page|
    	page.links.keep_if { |link|
      		link.to_s =~ /yahoo/
    	} 
  	end
	anemone.on_every_page do |page|
		# mainはスキップ
		next if page.url.to_s =~ /main.html/
		
		# detailディレクトリ配下のスクレイピング
		if page.url.to_s =~ /detail\/(?!sub).*.html/
			txt = page.doc.xpath('//h2').text
			puts txt
		end
		
		# subディレクトリ配下のスクレイピング
		if page.url.to_s =~ /detail\/sub\/.*/
			page.doc.xpath('//ul/li').each do |node|
				p node.xpath('//div[1]').text
			end
		end
	end
end