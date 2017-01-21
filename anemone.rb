require 'anemone'

Anemone.crawl("http://news.yahoo.co.jp/topics", :depth_limit => 1) do |anemone|
	anemone.focus_crawl do |page|
    	page.links.keep_if { |link|
      		link.to_s =~ /pickup/
    	}
  	end
  	
	anemone.on_every_page do |page|
		next if page.url.to_s =~ /topics/
		puts "title->#{page.doc.xpath('//a[@id="link"]').text}"
		puts "text->#{page.doc.xpath('//p[@class="hbody"]').text}"
		puts "link->#{page.doc.xpath('//a[@class="newsLink"]/@href')}"
		puts "\n"
	end
end