require_relative 'winner'

module BStats
	class BattingAverageWinner < Winner
		attr_writer :percent_improved

		def percent_improved
			@percent_improved || 0
		end
	end
end