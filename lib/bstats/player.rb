require_relative '../../db/db_config'
require 'csv'

module BStats
	class Player < ActiveRecord::Base
		has_many :player_batting_stats, :class_name => 'PlayerBattingStat', :foreign_key => 'external_id', :primary_key => 'external_id'

		validates :external_id, presence: true
		validates :birth_year, numericality: true

		def self.import_csv(file)
			begin
				CSV.foreach(file, headers: true) do |row|
					player = Player.new()
					player.external_id = row['playerID'].to_s
					player.birth_year = row['birthYear'].to_i
					player.first_name = row['nameFirst'].to_s
					player.last_name = row['nameLast'].to_s
					player.save
				end
			rescue CSV::MalformedCSVError => e
				# certain csv's have file endings that the CSV library doesn't like. Windows may or may not have something to do with that
				# TODO: log file ending failure
			end
		end
	end
end