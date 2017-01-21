require 'rubygems'
require 'mechanize'
require 'sequel'

#DB�ڑ�
options = {}
DB = Sequel.sqlite('test.db', options)

#DDL���h�L
unless DB.table_exists? :icons
  DB.create_table :icons do
      primary_key :id
      text :filename_large
      blob :icon_large
  end
end


#Mechanize�Ńt�@�C���̎擾
agent = WWW::Mechanize.new
agent.user_agent_alias = 'Windows IE 7'

url = 'http://a3.twimg.com/profile_images/590451151/_kamaboko2002.png'

#�摜�t�@�C���̎擾(get_file���\�b�h���g���ƃt�@�C���̎��̂𒼐ڎ擾�ł���)
img = agent.get_file(url)
filename = url.split('/')[-1]

#Hash�ɂ���DB�ɃC���T�[�g�BSequel::SQL::Blob��to_sequel_blob���\�b�h���g�����Ńf�[�^��blob���ł���B
list = {:filename_large => filename,
        :icon_large     => img.to_sequel_blob
       }
DB[:icons] << list




require 'rubygems'
require 'sequel'

#DB�ڑ�
options = {}
DB = Sequel.sqlite('test.db', options)

#�t�@�C����DB����擾���āA��������
ds = DB[:icons].filter(:id => 1)
ds.each {|icondata|
  File.open(icondata[:filename_large], 'wb'){|f| 
    f.write icondata[:icon_large]
  }
}