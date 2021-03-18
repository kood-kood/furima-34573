class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user,   null: false, foreign_key: true
      t.references :item,   null: false, foreign_key: true
      t.text       :text,   null: false 
      t.timestamps
    end
  end
end
