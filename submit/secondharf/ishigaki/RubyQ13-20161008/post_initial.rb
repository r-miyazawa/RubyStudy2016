require 'sqlite3'
require 'csv'

class Post_initial
	CSV_COLUMN = {code: 2, pref_kana: 3, city_kana: 4, addr_kana: 5, pref: 6, city: 7, addr: 8}
	
	def initialize(dbfile)
		@dbfile = dbfile
	end
	
	def create(zipfile)
		begin
		return if File.exist?(@dbfile)
		SQLite3::Database.open(@dbfile) do |db|
		db.execute(<<-SQL)
			CREATE TABLE IF NOT EXISTS zip_codes
				(code TEXT, pref_kana TEXT, city_kana TEXT, addr_kana TEXT, pref TEXT, city TEXT, addr TEXT, alladdr TEXT)
			SQL
		db.execute("BEGIN TRANSACTION")
			CSV.open(zipfile, "r:Shift_JIS:UTF-8") do |csv|
				csv.each do |rec|
					data = Hash.new
					CSV_COLUMN.each{ |key, index| data[key] = rec[index] }
					data[:alladdr] = data[:pref] + data[:city] + data[:addr]
					db.execute(<<-SQL, data)
						INSERT INTO zip_codes VALUES
							(:code, :pref_kana, :city_kana, :addr_kana, :pref, :city, :addr, :alladdr)
						SQL
					end
				end
				db.execute("COMMIT TRANSACTION")
			end
		return true
		rescue Exception => e
		print "#{e}"
			return e
		end
	end
end

test = Post_initial.new("address.db")
flg = test.create("KEN_ALL.CSV")
if flg == true
	p "success"
else
	p "failued"
end