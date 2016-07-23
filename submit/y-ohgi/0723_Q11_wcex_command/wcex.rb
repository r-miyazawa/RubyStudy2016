#!/usr/bin/env ruby
# coding: utf-8
require 'rubygems'
require 'thor'

class Wcex < Thor
  default_command :excute

  desc 'excute', 'ほげー'
  option :file, type: :string, aliases: '-f', desc: 'ファイルの選択'

  option :chars, type: :string, aliases: '-c', desc: 'サイズのみ取得'
  option :words, type: :string, aliases: '-w', desc: '単語数のみ取得'
  option :lines, type: :string, aliases: '-l', desc: '行数のみ取得'
  def excute
    filename = options[:file]?options[:file]:''

    # ファイルの存在確認
    if File.exist?(filename)
      file = File.open(filename)

      # ファイルサイズを取得
      fchars= file.size

      # 行数と単語数を取得
      flines = 0
      fwords = 0
      file.each_line do |line|
        flines += 1
        fwords += line.scan(/\w+/).length
      end

      # 結果を表示
      if options[:chars]
        puts "バイト数：#{fchars}"
      elsif options[:words]
        puts "単語数：#{fwords}"
      elsif options[:lines]
        puts "行数：#{flines}"
      else
        puts "結果：[lines=#{flines} words=#{fwords} chars=#{fchars}]"
      end
        
    else
      puts "ファイルを指定してね"
    end
  end
end


Wcex.start(ARGV)
