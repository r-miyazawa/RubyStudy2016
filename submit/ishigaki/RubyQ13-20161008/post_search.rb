require 'sqlite3'
require 'csv'

class Post_search
     
     def initialize(dbfile)
        @dbfile = dbfile 
     end
     
     def search(num)
        add = nil
        SQLite3::Database.open(@dbfile) do |db|
            db.execute("BEGIN TRANSACTION")
            query = "SELECT * FROM zip_codes WHERE code= '" + num +"'"
            add = db.execute(query)
        end

        if add.empty?
            p "存在しません"
        else
            kana = add[0][1] + add[0][2] + add[0][3]
            p "#{add[0][7]}(#{kana})"
        end
     end
     
end

num = Post_search.new("address.db")
search_num = ARGV[0]
num.search(search_num)
