require_relative '../../lib/bstats/player'
require_relative '../../lib/bstats/player_batting_stat'
require_relative 'winner'
require_relative 'batting_average_winner'

module BStats
	class NumberCrunch
		def self.most_improved_batting_average(from_year, to_year, min_at_bats=200)
			winner = BattingAverageWinner.new()
			get_grouped_at_bats(from_year, min_at_bats).each do |y1stat|
				get_grouped_at_bats(to_year, min_at_bats).each do | y2stat |
					if ((y2stat.hits_sum.to_f / y2stat.at_bats_sum.to_f) - (y1stat.hits_sum.to_f / y1stat.at_bats_sum.to_f)) > winner.percent_improved
						winner.percent_improved = ((y2stat.hits_sum.to_f / y2stat.at_bats_sum.to_f) - (y1stat.hits_sum.to_f / y1stat.at_bats_sum.to_f)).round(3)
						winner.player = y2stat.player
					end
				end
			end
			return winner
		end

		def self.team_slugging_percentage(team_id, year)
			PlayerBattingStat.where("team_id = ? AND year = ?", team_id, year)
		end

		def self.triple_crown_winner(league, year, min_at_bats=400)
			winner = Winner.new()
			btwinner = get_batting_title_winner(league, year, min_at_bats)
			home_run_king = get_home_run_king(league, year, min_at_bats)
			if btwinner.external_id == home_run_king.external_id
				most_rbis = get_most_rbis(league, year, min_at_bats)
				if btwinner.external_id == most_rbis.external_id
					winner.player = btwinner.player
				end
			end
			return winner
		end

		private

		def self.get_grouped_at_bats(year, min_at_bats=200)
			PlayerBattingStat.select(:id, :external_id, :year, "SUM(at_bats) as at_bats_sum", "SUM(hits) as hits_sum").where("year = ?", year).group(:external_id).having("sum(at_bats) >= ?", min_at_bats)
		end

		def self.get_batting_title_winner(league, year, min_at_bats)
			PlayerBattingStat.where("league = ? AND year = ? AND at_bats >= ?", league, year, min_at_bats).order('batting_average DESC').first
		end

		def self.get_home_run_king(league, year, min_at_bats)
			PlayerBattingStat.where("league = ? AND year = ? AND at_bats >= ?", league, year, min_at_bats).order('home_runs DESC').first
		end

		def self.get_most_rbis(league, year, min_at_bats)
			PlayerBattingStat.where("league = ? AND year = ? AND at_bats >= ?", league, year, min_at_bats).order('runs_batted_in DESC').first
		end
	end
end

