class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 4, scale: 0
      t.string :transmission
      t.decimal :seats, precision: 2, scale: 0
      t.string :body
      t.timestamps
    end
  end
end
