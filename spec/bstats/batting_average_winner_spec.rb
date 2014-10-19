require 'spec_helper'
require 'bstats/batting_average_winner'
require 'bstats/player'

module BStats
  describe BattingAverageWinner do
  	describe "before being loaded with a player" do
	  	before do
	  		@winner = BattingAverageWinner.new
	  	end

	  	it "should return 0 improvement" do
	  		expect(@winner.percent_improved).to eq(0)
	  	end
	end

	describe "after being loaded" do
	  	before do
	  		@winner = BattingAverageWinner.new
	  		@winner.percent_improved = 0.345
	  	end

	  	it "should return the right improvement percentage" do
	  		expect(@winner.percent_improved).to eq(0.345)
	  	end
	end
  end
end