require 'rubygems'
require 'sqlite3'

require './config.rb'

class Search

  def initialize(term)
    raise "DBが無い" unless File.exists?(DB_NAME)
    raise "valid error" unless term =~ /^[0-9]+$/
    @term = term
  end

  def execute
    sql = "SELECT * FROM zips WHERE alladdr LIKE ?"
    str = "str"

    SQLite3::Database.open(DB_NAME) do |db|
      db.execute(sql, "#{@term}%") do |row|
        ary << sprintf("%s %s", row[0], row[4]) << "\n"
      end
    end
    puts "結果:#{str}"
  end
  
end

Search.new(ARGV[0]).execute
