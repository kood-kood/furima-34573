class CreateClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :classifications do |t|
      # t.string      :name, null: false
      t.integer    :category_id
      t.references :item, foreign_key: true,  null: false
      t.timestamps
    end
  end
end
