class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,             null: false, default: ""
      t.integer    :price,                    null: false
      t.text       :description,              null: false
      t.integer    :product_condition_id,     null: false
      t.integer    :shipping_charge_id,       null: false
      t.integer    :shipping_area_id,         null: false
      t.integer    :days_to_ship_id,          null: false
      t.integer    :category_id,              null: false
      t.references :user, foreign_key: true,  null: false
      t.timestamps
    end
  end
  
end
