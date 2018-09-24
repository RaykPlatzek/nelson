class GiveAdvise

  def call(last_valuations)
    return "Can't give advise - no valuations found" if last_valuations.empty?
    @valuations = last_valuations.pluck(:price)
    @diff_start_end = @valuations.first - @valuations.last
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
    return true if (@diff_start_end / @valuations.last) > 0.05
    false
  end

  def dropped_more_than_1_pp?
    return true if (@diff_start_end / @valuations.last).abs > 0.01 && dropped?
    false
  end
end