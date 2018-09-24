class Pair < ApplicationRecord
  has_many :valuations
  default_scope { order(code: :asc) }

  def trend_color
    return "bg-danger" if trend == TREND_DOWN 
    return "bg-success" if trend == TREND_UP 
    "bg-info"
  end

  def advise
    GiveAdvise.new.call(last_valuations)
  end

  def last_valuations(number = NUMBER_VALUATIONS)
    valuations.reorder(created_at: :desc).take(number)
  end

  def current_valuation
    RetrieveValuationData.new.call([code])
    last_valuations(1).first
  end

  private 
end
