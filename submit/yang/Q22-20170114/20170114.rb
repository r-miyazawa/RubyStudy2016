require 'anemone'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Anemone.crawl("http://news.yahoo.co.jp/topics",:depth_limit => 1) do |anemone|
  
  anemone.focus_crawl do |page|
    page.links.keep_if { |link|
      link.to_s.match(/pickup/)
    } 
  end
  
  anemone.on_every_page do |page|
      next if page.url.to_s =~ /topics/
     
      p page.doc.xpath('//*[@id="main"]/div[1]/div[1]/div[3]/div[2]/h2').text
  	  p page.doc.xpath('//*[@id="main"]/div[1]/div[1]/div[3]/div[2]/p').text
  	  p page.doc.xpath('//*[@id="link"]').text
  end

end