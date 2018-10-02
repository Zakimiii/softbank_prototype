class CreateGroupContents < ActiveRecord::Migration
  def change
    create_table :group_contents do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.text :article
      t.references :group, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
