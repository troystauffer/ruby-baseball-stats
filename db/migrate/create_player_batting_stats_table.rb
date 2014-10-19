require_relative '../db_config'

class CreatePlayerBattingStatsTable < ActiveRecord::Migration

  def up
    create_table :player_batting_stats do |t|
      t.string  :external_id
      t.string  :year
      t.string  :league
      t.string  :team_id
      t.integer :games,               :default => 0
      t.integer :at_bats,             :default => 0
      t.integer :runs,                :default => 0
      t.integer :hits,                :default => 0
      t.integer :doubles,             :default => 0
      t.integer :triples,             :default => 0
      t.integer :home_runs,           :default => 0
      t.integer :runs_batted_in,      :default => 0
      t.integer :stolen_bases,        :default => 0
      t.integer :caught_stealing,     :default => 0
      t.decimal :batting_average,     :default => 0.0,  :precision => 1, :scale => 3
      t.decimal :slugging_percentage, :default => 0.0,  :precision => 1, :scale => 3
    end
  end 

  def down
    drop_table :player_batting_stats
  end

end