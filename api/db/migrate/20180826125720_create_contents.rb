class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :contentable_id
      t.string :contentable_type
      t.timestamps null: false
    end
    add_index :contents, [:contentable_id, :contentable_type]
  end
end
