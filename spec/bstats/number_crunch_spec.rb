require 'spec_helper'
require 'bstats/number_crunch'
require 'bstats/batting_average_winner'

module BStats
  describe NumberCrunch do
    describe "calculating batting average" do
        before do 
            @stat1 = mock_model( 
                PlayerBattingStat, :external_id => "cabremi01", :year => "2011", :league => "AL", :team_id => "DET", :games => 161, :at_bats => 622, :runs => 109, :hits => 205, :doubles => 40, :triples => 0, :home_runs => 44, :runs_batted_in => 139, :stolen_bases => 4, :caught_stealing => 1, :hits_sum => 205, :at_bats_sum => 622
            )
            @stat2 = mock_model( 
                PlayerBattingStat, :external_id => "cabremi01", :year => "2012", :league => "AL", :team_id => "DET", :games => 161, :at_bats => 622, :runs => 109, :hits => 205, :doubles => 40, :triples => 0, :home_runs => 44, :runs_batted_in => 139, :stolen_bases => 4, :caught_stealing => 1, :hits_sum => 205, :at_bats_sum => 622
            ) 
            @stats = [@stat1, @stat2] 
            allow(NumberCrunch).to receive(:get_grouped_at_bats).and_return(@stats)
        end 
        it "finds the most improved batting average" do
            expect(NumberCrunch.most_improved_batting_average('2007', '2008').percent_improved).to eq(0)
        end
    end
    describe "calculating triple crown winner" do
        before do 
            @player = mock_model(Player, :external_id => "cabremi01" )
            @stat2 = mock_model( 
                PlayerBattingStat, :external_id => "cabremi01", :year => "2012", :league => "AL", :team_id => "DET", :games => 161, :at_bats => 622, :runs => 109, :hits => 205, :doubles => 40, :triples => 0, :home_runs => 44, :runs_batted_in => 139, :stolen_bases => 4, :caught_stealing => 1, :hits_sum => 205, :at_bats_sum => 622, :player => @player
            )             
            allow(NumberCrunch).to receive(:get_batting_title_winner).and_return(@stat2)
            allow(NumberCrunch).to receive(:get_home_run_king).and_return(@stat2)
            allow(NumberCrunch).to receive(:get_most_rbis).and_return(@stat2)
        end 
        it "finds the triple crown winner" do
            expect(NumberCrunch.triple_crown_winner("AL", "2012").player.external_id).to eq("cabremi01")
        end
    end
  end
end