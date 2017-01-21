require 'rubygems'
require 'mechanize'
require 'sequel'

#DB接続
options = {}
DB = Sequel.sqlite('test.db', options)

#DDLモドキ
unless DB.table_exists? :icons
  DB.create_table :icons do
      primary_key :id
      text :filename_large
      blob :icon_large
  end
end


#Mechanizeでファイルの取得
agent = WWW::Mechanize.new
agent.user_agent_alias = 'Windows IE 7'

url = 'http://a3.twimg.com/profile_images/590451151/_kamaboko2002.png'

#画像ファイルの取得(get_fileメソッドを使うとファイルの実体を直接取得できる)
img = agent.get_file(url)
filename = url.split('/')[-1]

#HashにしてDBにインサート。Sequel::SQL::Blobのto_sequel_blobメソッドを使う事でデータをblob化できる。
list = {:filename_large => filename,
        :icon_large     => img.to_sequel_blob
       }
DB[:icons] << list




require 'rubygems'
require 'sequel'

#DB接続
options = {}
DB = Sequel.sqlite('test.db', options)

#ファイルをDBから取得して、書き込み
ds = DB[:icons].filter(:id => 1)
ds.each {|icondata|
  File.open(icondata[:filename_large], 'wb'){|f| 
    f.write icondata[:icon_large]
  }
}