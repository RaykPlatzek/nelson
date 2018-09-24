require 'rails_helper'

RSpec.describe "UpdatePairValuationsJob", :vcr do

  describe "updates all pairs" do
      before do
        puts "...creating default currency pairs"
        ["AUDUSD", "USDAUD", "AUDEUR"].each { |code| Pair.find_or_create_by!(code: code) }
      end

    it "creates new valuations for correct pair" do
      expect(Pair.count).to eq 3
      expect(Valuation.count).to eq 0
      UpdatePairValuationsJob.perform_now
      
      expect(Valuation.count).to eq 3
      expect(Pair.find_by(code: AUDEUR).valuations.first).to have_attributes(pair_id: Pair.find_by(code: AUDEUR).id, timestamp: 1537778195, price: 0.618253.to_d, bid: 0.618261.to_d, ask: 0.618249.to_d)
      expect(Pair.find_by(code: USDAUD).valuations.first).to have_attributes(pair_id: Pair.find_by(code: USDAUD).id, timestamp: 1537778196, price: 1.37484.to_d, bid: 1.37484.to_d, ask: 1.37484.to_d)
      expect(Pair.find_by(code: AUDUSD).valuations.first).to have_attributes(pair_id: Pair.find_by(code: AUDUSD).id, timestamp: 1537778196, price: 0.72735.to_d, bid: 0.72735.to_d, ask: 0.72735.to_d)
    end

    it "does not overwrite existing valuations" do
      Pair.find_by(code: AUDEUR).valuations.create!(price: 100)
      expect(Valuation.count).to eq 1
      UpdatePairValuationsJob.perform_now
      expect(Valuation.count).to eq 4
      expect(Pair.find_by(code: AUDEUR).valuations.count).to eq 2
      expect(Pair.find_by(code: AUDEUR).valuations.map(&:price)).to include(100)
    end
  end
end