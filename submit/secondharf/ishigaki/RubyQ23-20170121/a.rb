require 'anemone'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Anemone.crawl("http://store-tsutaya.tsite.jp/item.html") do |anemone|
	anemone.focus_crawl do |page|
		page.links.keep_if { |link|
			link.to_s =~ /item/
		}
	end
	anemone.on_every_page do |page|
		genre = page.doc.xpath('//p[@class="conditionText"]/strong').text
		if !genre.empty? then
			puts "--------------#{genre}--------------"
		end

		title = page.doc.xpath('//div[@class="detailBox"]/dl/dt/a').text.gsub(" ", "")
		puts title
		
		url = page.doc.xpath('//div[@class="imgBox"]/dl/dd/a/@href')
		puts url
	end
end
