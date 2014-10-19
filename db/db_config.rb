require 'active_record'
require 'sqlite3'
I18n.enforce_available_locales = false
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/temp.db'
)