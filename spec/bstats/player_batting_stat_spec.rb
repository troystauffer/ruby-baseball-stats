require 'spec_helper'
require 'csv'
require 'bstats/player_batting_stat'

module BStats
  describe PlayerBattingStat do

    describe "Importing a CSV" do
		let(:data) { "abercre01\t2007\tNL\tFLO\t35\t76\t16\t15\t3\t0\t2\t5\t7\t1\rabreubo01\t2012\tAL\tLAA\t8\t24\t1\t5\t3\t0\t0\t5\t0\t0" }
		before do
			allow(CSV).to receive(:foreach).with("file_path", headers: true).and_return(data)
		end

		it "should read the CSV it is passed" do
			expect(PlayerBattingStat.import_csv("file_path")).to eq(data)
		end
    end

    describe "calculating stats" do
    	it "should calculate the batting average" do
    		expect(PlayerBattingStat.calculate_batting_average(3, 9)).to eq(0.333)
    	end
    	it "should calculate the slugging percentage" do
    		expect(PlayerBattingStat.calculate_slugging_percentage(15, 3, 0, 2, 76)).to eq(0.316)
    	end
    end
  end
end