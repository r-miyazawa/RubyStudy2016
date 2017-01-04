html = "
<html>
<body>
<p><a href=\"zipcode.php?pref=13&city=1131160&id=49058\">minami ikebukuro</a></p>
<p><a href=\"zipcode.php?pref=14&city=1131161&id=49059\">minami ootsuka</a></p>
<p><a href=\"zipcode.php?pref=15&city=1131162&id=49060\">minami nagasaki</a></p>
<p><a href=\"zipcode.php?pref=16&city=1131163&id=49061\">mejiro</a></p>
</body>
</html>
"
puts "---a scan---"
html.scan(/<p><a href="zipcode.php?.*?>(.*?)<\/a><\/p>/) do |a|
  puts a
end
puts "---pref,city scan"
zipcode = Array.new(2){ Array.new }
html.scan(/<p><a href="zipcode.php\?(.*?)&(.*?)">/) do |row|
  zipcode[0].push(row[0].delete!("pref="))
  zipcode[1].push(row[1].delete!("city="))
end

print "pref="
p zipcode[0]
print "city="
p zipcode[1]



