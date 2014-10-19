require 'active_record'
require 'sqlite3'
I18n.enforce_available_locales = false
db_file =  File.join(File.dirname(__FILE__), 'temp.db')
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => db_file
)