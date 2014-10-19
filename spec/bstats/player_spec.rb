require 'spec_helper'
require 'csv'
require 'bstats/player'

module BStats
  describe Player do

    describe "Importing a CSV" do
		let(:data) { "id1\t1900\tfirst\tlast\rid2\t1901\tfirst2\tlast2"}

		before do
			allow(CSV).to receive(:foreach).with("file_path", headers: true).and_return(data)
		end

		it "should read the CSV it is passed" do
			expect(Player.import_csv("file_path")).to eq(data)
		end
    end
  end
end