#!/usr/bin/env ruby
# coding: utf-8

class Check
  
  def self.start(form)
    userCheck = []
    begin
      form.each do |quest|
        userCheck << {
          name: quest[:name],
          input: question(quest)
        }
      end
    rescue => e
      puts "Error"
      return false
    end

    userCheck.each{ |a| puts "#{a[:name]} : #{a[:input]}" }
  end

  def self.question(form)
    text = input(form[:text])
    return text if validate(text, form[:regexp])
    puts "ダメな値"
    question(form)
  end

  def self.validate(text, regexp)
    text =~ regexp
  end

  def self.input(text)
    puts text
    print "=>"
    i = $stdin.gets.chomp
    raise "exit" if i  == "exit"
    i
  end
  
end

user = [
  {
    name: "名前",
    text: "名前を入力",
    regexp: /\A@[A-Z]{3,}\z/
  },
  {
    name: "電話番号",
    text: "電話番号を入力",
    regexp: /\A([0-9]{3,})-([0-9]{4,})-([0-9]{4,})|([0-9]{4,})-([0-9]{3,})-([0-9]{3,})|([0-9]{3,})-([0-9]{3,})-([0-9]{4,})\z/
  },
  {
    name: "郵便番号",
    text: "郵便番号を入力",
    regexp: /\A[0-9]{7}\z|\A[0-9]{3}-[0-9]{4}\z/
  },
  {
    name: "メール",
    text: "メールを入力",
    regexp: /\A([\w+-_.!$#%])+@([\w+-_.!$#%])+\.([\w+-_.!$#%])+\z/
  }
]

Check.start(user)