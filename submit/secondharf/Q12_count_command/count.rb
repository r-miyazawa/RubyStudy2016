#!/usr/bin/env ruby
# coding: utf-8
require 'rubygems'
require 'thor'

class IllegalError < StandardError; end

class Count < Thor
  default_command :excute
  
  option :file, type: :string, aliases: '-f', desc: 'ファイルの選択'
  option :words, type: :string, aliases: '-c', desc: '文字列の数を表示'
  option :lines, type: :string, aliases: '-l', desc: '文字列が含まれる行数を表示'
  
  desc 'excute', '指定ファイルの指定文字列を検索'
  def excute(filename, term)
    file(filename)
    
    if options[:words]
      puts "結果:#{search(term)}回"
    elsif options[:lines]
      puts "結果:#{search_line(term)}行"
    else options[:file]
      puts "結果:[line=#{search_line(term)} count=#{search(term)}]"
    end
  end
  

  private
  # ファイルを取得
  def file(name = "")
    # No such fileエラーを起こさせる為存在確認させない
    @file ||= File.read(name)
  end

  # 対象文字列の出現回数のカウント
  def search(term)
    file.scan(term).count
  end

  # 対象文字列の出現行数のカウント
  def search_line(term)
    result = []
    f = file.split
    
    f.each_index do |i|
      # 現在の行に単語が存在するか判定
      result << i+1 if f[i].scan(term).first
    end
    
    result.count
  end

end

Count.start(ARGV)
