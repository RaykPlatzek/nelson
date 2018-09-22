class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image
      t.integer :ranking
      t.integer :level
      t.timestamps
    end
  end
end
