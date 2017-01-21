require 'anemone'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
Anemone.crawl('https://tech-c2016.github.io/sample/hierarchy/main.html',
:depth_limit => 2) do |anemone|

  anemone.focus_crawl do |page|
    page.links.keep_if { |link|
      link.to_s.match =~ /yahoo/
    }
  end

  anemone.on_every_page do |page|
    p page.url
  end
end
