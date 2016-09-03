# coding: utf-8
require 'thor'

class Bmi < Thor
  desc 'bmi {height} {weight}', 'bmi値が得られるよ'
  def bmi(height, weight)
    puts weight.to_i / ((height.to_i*0.01) * (height.to_i*0.01))
  end
end

Bmi.start(ARGV)
