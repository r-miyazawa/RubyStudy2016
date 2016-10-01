def bmi(weight, height)
  mHeight = height / 100.to_f
  return weight / (mHeight * mHeight).to_f
end

puts bmi(50,160)