class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.text :text, null: false
      t.text :image
      t.integer :fromUser_id, null: false
      t.integer :toUser_id, null: false
      t.timestamps null: false
    end
    add_index :user_messages, [:fromUser_id, :toUser_id]
  end
end
