class CreateFieldings < ActiveRecord::Migration
  def change
    create_table :fieldings do |t|
      t.integer :contentable_id
      t.string :contentable_type
      # t.references :field, foreign_key: true, null: false
      t.timestamps null: false
    end
  add_index :fieldings, [:contentable_id, :contentable_type]
  end
end
