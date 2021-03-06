require_relative 'bstats/player'
require_relative 'bstats/player_batting_stat'
require_relative 'bstats/data_persistence'
require_relative 'bstats/number_crunch'

begin
	if ARGV[0] == 'import'
		dp = BStats::DataPersistence.new()
	 	dp.teardown_db()
	 	dp.initialize_db()
	 	puts "Importing data..."
	 	player_file = File.join(Dir.pwd, 'Master-small.csv')
	 	stats_file = File.join(Dir.pwd, 'Batting-07-12.csv')
		BStats::Player.import_csv(player_file)
		BStats::PlayerBattingStat.import_csv(stats_file)
	end

	ba_winner = BStats::NumberCrunch.most_improved_batting_average(from_year=2009, to_year=2010)
	puts "Most Improved Batting Average (2009-2010):"
	puts "\tName: #{ba_winner}"
	puts "\tBatting Average Improvement: #{ba_winner.percent_improved}"


	puts "\r\n2007 Oakland A's Slugging Percentage:"
	puts "Name\t\t\tSlugging Percentage"
	BStats::NumberCrunch.team_slugging_percentage('OAK', 2007).each do |stat|
		puts "#{stat.player.last_name}, #{stat.player.first_name}\t\t#{'%.3f' % stat.slugging_percentage}"
	end

	al11 = BStats::NumberCrunch.triple_crown_winner('AL', 2011)
	puts "2011 AL Triple Crown Winner: #{al11}"
	nl11 = BStats::NumberCrunch.triple_crown_winner('NL', 2011)
	puts "2011 NL Triple Crown Winner: #{nl11}"
	al12 = BStats::NumberCrunch.triple_crown_winner('AL', 2012)
	puts "2012 AL Triple Crown Winner: #{al12}"
	nl12 = BStats::NumberCrunch.triple_crown_winner('NL', 2012)
	puts "2012 NL Triple Crown Winner: #{nl12}"

rescue Errno::ENOENT => e
	puts "Files needed to import aren't in the directory calling this script. Include 'Master-small.csv' and 'Batting-07-12.csv' in the directory from which you execute this script."
rescue Exception => e
	puts e.class
	puts e.inspect
	puts e.backtrace
end