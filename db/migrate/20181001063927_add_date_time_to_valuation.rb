class AddDateTimeToValuation < ActiveRecord::Migration[5.2]
  def change
    add_column :valuations, :date_time, :datetime
    Valuation.all.where(date_time: nil).each {|valuation| valuation.update!(date_time: Time.at(valuation.timestamp))}
  end
end
