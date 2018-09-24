class AddTrendToValuation < ActiveRecord::Migration[5.2]
  def change
    add_column :valuations, :trend, :string, default: TREND_NO_CHANGE
  end
end
