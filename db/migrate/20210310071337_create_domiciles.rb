class CreateDomiciles < ActiveRecord::Migration[6.0]
  def change
    create_table :domiciles do |t|
      t.string     :address,                 null: false, default: ""
      t.string     :phone_number,            null: false, default: ""
      t.string     :postal_code,             null: false, default: ""
      t.integer    :shipping_area_id,        null: false
      t.string     :municipality,            null: false, default: ""
      t.string     :building_name
      t.timestamps
    end
  end
end
