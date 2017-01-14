html = "
<html>
  <body>
    my name is <b>sato</b>.my is <b>suzuki</b>.
    my name is <b>tanaka</b>.
    this is a <p>pen</p>.
    this is a <p>book</p>.
  </body>
</html>
"
puts "---b scan---"
html.scan(/<b>(.*?)<\/b>/) do |b|
  puts b
end

puts "---p scan---"
html.scan(/<p>(.*?)<\/p>/) do |p|
  puts p
end

