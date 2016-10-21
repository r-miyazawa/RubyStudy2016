class Leap
  def checkYear?(n)
    if n%400 == 0
      return true
    end

    if n%4 == 0 && n%100 == 0
      return false
    end

    if n%4 == 0
      return true
    end

    return false
  end
end

(0..2014).each do |n|
leap =  Leap.new
puts  n   if leap.checkYear?(n)
end
