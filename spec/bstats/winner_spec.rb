require 'spec_helper'
require 'bstats/winner'
require 'bstats/player'

module BStats
  describe Winner do
  	describe "before being loaded with a player" do
	  	before do
	  		@winner = Winner.new
	  	end

	  	it "should have no player" do
	  		expect(@winner.player).to eq(nil)
	  	end

	  	it "should not report awarded" do
	  		expect(@winner.awarded?).to be_falsey
	  	end

	  	it "should read no winner" do
	  		expect(@winner.to_s).to eq("No winner.")
	  	end
	end

	describe "after being loaded with a player" do
	  	before do
	  		@player = mock_model(Player, :last_name => "Baseball", :first_name => "Mr" )
	  		@winner = Winner.new
	  		@winner.player = @player
	  	end

	  	it "should have a player" do
	  		expect(@winner.player).to eq(@player)
	  	end

	  	it "should report awarded" do
	  		expect(@winner.awarded?).to be_truthy
	  	end

	  	it "should read winners name" do
	  		expect(@winner.to_s).to eq("Baseball, Mr")
	  	end
	end
  end
end