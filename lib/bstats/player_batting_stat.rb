require_relative '../../db/db_config'
require 'csv'

module BStats
	class PlayerBattingStat < ActiveRecord::Base
		belongs_to :player, :class_name => "Player", :foreign_key => 'external_id', :primary_key => 'external_id'

		validates :external_id, presence: true
		validates :games, :at_bats, :runs, :hits, :doubles, :triples, :home_runs, :runs_batted_in, :stolen_bases, :caught_stealing, numericality: true

		def self.import_csv(file)
			CSV.foreach(file, headers: true) do |row|
				stat = PlayerBattingStat.new()
				stat.external_id = row['playerID'].to_s
				stat.year = row['yearID'].to_s
				stat.league = row['league'].to_s
				stat.team_id = row['teamID'].to_s
				stat.games = row['G'].to_i
				stat.at_bats = row['AB'].to_i
				stat.runs = row['R'].to_i
				stat.hits = row['H'].to_i
				stat.doubles = row['2B'].to_i
				stat.triples = row['3B'].to_i
				stat.home_runs = row['HR'].to_i
				stat.runs_batted_in = row['RBI'].to_i
				stat.stolen_bases = row['SB'].to_i
				stat.caught_stealing = row['CS'].to_i
				stat.batting_average = self.calculate_batting_average(stat.hits, stat.at_bats)
				stat.slugging_percentage = self.calculate_slugging_percentage(stat.hits, stat.doubles, stat.triples, stat.home_runs, stat.at_bats)
				stat.save
			end
		end

		def self.calculate_batting_average(hits, at_bats)
			[0, "0", ""].include?(at_bats) ? 0 : (hits.to_f / at_bats.to_f).round(3)
		end

		def self.calculate_slugging_percentage(hits, doubles, triples, home_runs, at_bats)
			[0, "0", ""].include?(at_bats) ? 0 : (((hits - doubles - triples - home_runs) + (2 * doubles) + (3 * triples) + (4 * home_runs)).to_f / at_bats).round(3)
		end
	end
end