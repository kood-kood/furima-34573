class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name
      t.integer    :price
      t.text       :description
      t.integer    :product_condition
      t.integer    :shipping_charge
      t.integer    :shipping_area
      t.integer    :days_to_ship
      t.integer    :category
      t.references :user, foreign_key: true
      t.timestamps
    end
  end

end
