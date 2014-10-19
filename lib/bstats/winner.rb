module BStats
	class Winner
		attr_accessor :player

		def initialize
			@player = nil
		end		

		def awarded?
			[nil, ""].include?(@player) ? false : true
		end

		def to_s
			awarded? ? "#{@player.last_name}, #{@player.first_name}" : "No winner."
		end
	end
end