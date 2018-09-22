class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image
      t.integer :ranking, default: 0
      t.integer :level, default: 1
      t.timestamps
    end
  end
end
