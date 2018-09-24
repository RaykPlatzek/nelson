class AddTimestampToValuations < ActiveRecord::Migration[5.2]
  def change
    add_column :valuations, :timestamp, :integer
  end
end
