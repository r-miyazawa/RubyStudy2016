range = 1..9
i = 0

range.each { |col|
  linestr = ""
  range.each { |line|
    linestr += sprintf("%02d", col * line)+ " "
  }
  puts linestr
}
