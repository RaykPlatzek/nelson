class Pair < ApplicationRecord

  default_scope { order(code: :asc) }

  def trend_color
    return "bg-danger" if trend == TREND_DOWN 
    return "bg-success" if trend == TREND_UP 
    "bg-info"
  end

  def self.all_pairs
    all_pairs = []
    uniq_codes.each do |code|
      all_pairs << Pair.find_by(code: code)      
    end
    all_pairs
  end

  def advise
    GiveAdvise.new.call(find_last_valuations)
  end

  def find_last_valuations
    Pair.where(code: code).reorder(timestamp: :desc).take(NUMBER_VALUATIONS)
  end

  private 

  def self.uniq_codes
    Pair.all.map(&:code).uniq
  end

end
