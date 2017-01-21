require 'sqlite3'

class Search

  def initialize(term)
    raise "DBが無い" unless File.exists?("post.db")
    raise "valid error" unless term =~ /^[0-9]+$/
    @term = term
  end

  def execute
    sql = "SELECT * FROM zips WHERE code LIKE ?"
    ary = []

    SQLite3::Database.open("post.db") do |db|
      db.execute(sql, "#{@term}%") do |row|
        ary << sprintf("%s %s", row[0], row[4]) << "\n"
      end
    end
    puts "結果:[count=#{ary.count}"
  end
  
end

Search.new(ARGV[0]).execute