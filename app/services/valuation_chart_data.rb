class ValuationChartData
  attr_reader :date_range_chart, :valuation_labels, :valuation_ask_numbers, :valuation_bid_numbers, :valuation_price_numbers, :valuation_open_price_numbers
  
  def initialize(pair, from_date, to_date)
    @pair = pair
    @valuations = @pair.valuations.where('date_time between ? and ?', from_date, to_date)
    @date_range_chart = @valuations.map {|valuation| valuation.date_time.to_s}
    generate_data_pairs_for_all_prices
  end

  private

  def generate_data_pairs_for_all_prices
    @valuation_labels = @valuations.map {|valuation| "Bid Price: #{valuation.bid}, Ask Price: #{valuation.ask}, Price: #{valuation.price}"}
    @valuation_ask_numbers = @valuations.map(&:ask)
    @valuation_bid_numbers = @valuations.map(&:bid)
    @valuation_price_numbers = @valuations.map(&:price)
    @valuation_open_price_numbers = @valuations.map(&:price).unshift(0)
  end
end
