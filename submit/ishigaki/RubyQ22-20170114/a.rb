require 'anemone'
$KCODE = "UTF-8"
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Anemone.crawl("http://news.yahoo.co.jp/topics", :depth_limit => 3) do |anemone|
	anemone.focus_crawl do |page|
    	page.links.keep_if { |link|
      		link.to_s =~ /pickup/
    	}
  	end
  	
	anemone.on_every_page do |page|
		next if page.url.to_s =~ /topics/
		puts "Title:#{page.doc.xpath('//a[@id="link"]').text}"
		puts "Desc:#{page.doc.xpath('//p[@class="hbody"]').text}"
		puts "Link:#{page.doc.xpath('//a[@class="newsLink"]/@href')}"
		puts "\n"
	end
end


