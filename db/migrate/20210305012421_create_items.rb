class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name             null: false, default: ""
      t.integer    :price                    null: false, default: ""
      t.text       :description              null: false, default: ""
      t.integer    :product_condition_id     null: false, default: ""
      t.integer    :shipping_charge_id       null: false, default: ""
      t.integer    :shipping_area_id         null: false, default: ""
      t.integer    :days_to_ship_id          null: false, default: ""
      t.integer    :category_id              null: false, default: ""
      t.references :user, foreign_key: true  null: false, default: ""
      t.timestamps
    end
  end
  
end
