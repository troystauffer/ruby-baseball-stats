require_relative '../../db/migrate/create_players_table'
require_relative '../../db/migrate/create_player_batting_stats_table'

module BStats
	class DataPersistence
		def initialize_db()
			CreatePlayersTable.migrate(:up)
			CreatePlayerBattingStatsTable.migrate(:up)
		end

		def teardown_db()
			CreatePlayersTable.migrate(:down)
			CreatePlayerBattingStatsTable.migrate(:down)
		end
	end
end