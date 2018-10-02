class CreateUserContents < ActiveRecord::Migration
  def change
    create_table :user_contents do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.text :article
      t.references :user, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
