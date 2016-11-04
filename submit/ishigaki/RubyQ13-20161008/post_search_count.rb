require 'sqlite3'
require 'csv'

class Post_search_count
     
     def initialize(dbfile)
        @dbfile = dbfile 
     end
     
     def count(num)
        count = 0
        SQLite3::Database.open(@dbfile) do |db|
            db.execute("BEGIN TRANSACTION")
            query = "SELECT * FROM zip_codes WHERE code LIKE '" + num + "%'"
            count = db.execute(query)
        end
        p "count=#{count.length}"
     end
     
end

num = Post_search_count.new("address.db")
serach_num = ARGV[0]
num.count(serach_num)
