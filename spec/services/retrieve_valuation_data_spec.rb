require 'rails_helper'

RSpec.describe "RetrieveValuationData", :vcr do

  let(:pair) {Pair.create(code: AUDEUR, trend: TREND_NO_CHANGE)}

  describe "retrieves new valuations from forex.1forge.com" do
    it "creates new valuations for correct pair" do
      expect(pair.valuations.count).to eq 0
      RetrieveValuationData.new.call([AUDEUR])
      expect(Pair.count).to eq 1
      expect(pair.valuations.count).to eq 1
      expect(pair.valuations.first).to have_attributes(price: 0.618288.to_d, bid: 0.618299.to_d, ask: 0.618276.to_d, timestamp: 1537778146)
    end
  end

  describe "updates trend" do
    it "down if price goes down" do
      pair.valuations.create!(price: 100)
      RetrieveValuationData.new.call([AUDEUR])
      expect(pair.last_valuations(1).first.price).to eq 0.618257.to_d
      expect(pair.reload.trend).to eq TREND_DOWN
    end

    it "up if price goes up" do
      pair.valuations.create!(price: 0.001)
      RetrieveValuationData.new.call([AUDEUR])
      expect(pair.last_valuations(1).first.price).to eq 0.618223.to_d
      expect(pair.reload.trend).to eq TREND_UP
    end

    it "no_change if price no_change" do
      pair.valuations.create!(price: 0.618185)
      RetrieveValuationData.new.call([AUDEUR])
      expect(pair.last_valuations(1).first.price).to eq 0.618185.to_d
      expect(pair.reload.trend).to eq TREND_NO_CHANGE
    end

    it "no_change if no price before" do
      RetrieveValuationData.new.call([AUDEUR])
      expect(pair.last_valuations(1).first.price).to eq 0.618185.to_d
      expect(pair.reload.trend).to eq TREND_NO_CHANGE
    end
  end
end