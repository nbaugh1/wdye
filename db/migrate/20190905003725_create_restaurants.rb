class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.string :neighborhood
      t.integer :price_point

      t.timestamps
    end
  end
end
