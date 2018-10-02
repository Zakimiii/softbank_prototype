class CreateGroupMessages < ActiveRecord::Migration
  def change
    create_table :group_messages do |t|
      t.text :text, null: false
      t.text :image
      t.references :group, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
