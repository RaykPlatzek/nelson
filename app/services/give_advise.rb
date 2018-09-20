class GiveAdvise

  def call(last_ten_pairs)
    return if last_ten_pairs.empty?
    @last_ten_prices = last_ten_pairs.pluck(:price)
    @diff_start_end = @last_ten_prices.first - @last_ten_prices.last
    return BUY if dropped? 
    return SELL if increased_more_than_5_pp?
    STAY
  end

  private

  def dropped?
   return true if @diff_start_end < 0
   false
  end

  def increased?
    return true if @diff_start_end > 0
    false
  end

  def increased_more_than_5_pp?
    return true if (@diff_start_end / @last_ten_prices.last) > 0.05
    false
  end

  def dropped_more_than_1_pp?
    return true if (@diff_start_end / @last_ten_prices.last).abs > 0.01 && dropped?
    false
  end
end