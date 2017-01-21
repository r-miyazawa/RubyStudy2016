require 'mechanize'
require 'openssl'
require 'rubygems'


OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE


agent = Mechanize.new do |dis|
	dis.user_agent_alias = 'Mac Safari'
	end
page = agent.get('http://google.com/');
form = page.forms.first
form.q = 'ruby'
agent.submit(form)


page.links.each do |link|
	puts link.text
	puts link.href
	end
	