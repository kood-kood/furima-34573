class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name
      t.integer    :price
      t.text       :description
      t.integer    :product_condition_id
      t.integer    :shipping_charge_id
      t.integer    :shipping_area_id
      t.integer    :days_to_ship_id
      t.integer    :category_id
      t.references :user_id, foreign_key: true
      t.timestamps
    end
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
  belongs_to :category
end
