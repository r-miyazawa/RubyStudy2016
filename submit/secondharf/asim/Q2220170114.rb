require 'open-uri'
require 'nokogiri'
require 'active_record'
require 'sqlite3'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

url = "http://jp.reuters.com/"

doc = Nokogiri::HTML(open(url + "theWire/",&:read))

doc.xpath('//div[@class="module-container-wire wire-container"]').each do |node|
	puts node
end
