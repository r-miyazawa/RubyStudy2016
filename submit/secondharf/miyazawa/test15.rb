#　課題15問2.
#　ヒアドキュメント<<　
html = <<HTML
<html>
<body>
<p><a href="zipcode.php?pref=13&city=1131160&id=49058">minami ikebukuro</a></p>
<p><a href="zipcode.php?pref=14&city=1131161&id=49059">minami ootsuka</a></p>
<p><a href="zipcode.php?pref=15&city=1131162&id=49060">minami nagasaki</a></p>
<p><a href="zipcode.php?pref=16&city=1131163&id=49061">mejiro</a></p>
</body>
</html>
HTML

a_tags= []
html.scan(/<a.*>.*<\/a>/).map do |line|
  hash = {
    text: line.match(/<a href=".*">([^<]+)<\/a>/)[1],
    pref:line.match(/pref=[0-9]+/).to_s.scan(/[0-9]+/)[0],
    city:line.match(/city=[0-9]+/).to_s.scan(/[0-9]+/)[0]
  }

  a_tags.push hash
end

puts "<a>"
a_tags.each do |tag|
  puts tag[:text]
end

puts ""

pref_ary = []
city_ary = []
puts "pref city文字列"
a_tags.each do |tag|
  pref_ary.push tag[:pref]
  city_ary.push tag[:city]
end

puts "pref=#{pref_ary.join(',')}"
puts "city=#{city_ary.join(',')}"
