class Pair < ApplicationRecord

  default_scope { order(timestamp: :desc) }
  scope :aud_usd, -> { where(code: AUDUSD) }
  scope :aud_eur, -> { where(code: AUDEUR) }

  def trend_color
    return "bg-danger" if trend == "down" 
    return "bg-success" if trend == "up" 
    "bg-info"
  end
end
