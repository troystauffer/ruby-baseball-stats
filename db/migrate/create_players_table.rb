require_relative '../db_config'

class CreatePlayersTable < ActiveRecord::Migration

  def up
    create_table :players do |t|
      t.string  :external_id
      t.integer :birth_year
      t.string  :first_name
      t.string  :last_name
    end
  end 

  def down
    drop_table :players
  end

end