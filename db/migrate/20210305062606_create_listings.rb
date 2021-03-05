class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :category           , null: false
      t.string :product_condition  , null: false
      t.string :shipping_charge    , null: false
      t.string :shipping_area      , null: false
      t.date   :days_to_ship       , null: false
      t.integer :item_id           , null: false
      t.timestamps
    end
  end
end
