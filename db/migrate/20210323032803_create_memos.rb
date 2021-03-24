class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.text     :memo,     null: false
      t.references :user,   foreign_key: true,  null: false
      t.timestamps
    end
  end
end
