#課題15問1.
html = <<HTML
<html>
<body>
my name is <b>sato</b>.my name is <b>suzuki</b>.
my name is <b>tanaka</b>.
this is a <p>pen</p>.
this is a <p>book</p>.
</body>
</html>
HTML
a_tags = []
p_tags = []

html.scan(/<b>.*<\/b>/).map do |line|
  a_tags.push line.gsub!(/<(\/*)b>/,'')
end
html.scan(/<p>.*<\/p>/).map do |line|
  p_tags.push line.gsub!(/<(\/*)p>/,'')
end

puts "<b>"
puts a_tags

puts "<p>"
puts p_tags
