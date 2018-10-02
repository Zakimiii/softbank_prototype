class CreateGroups < ActiveRecord::Migration
  def up
    create_table :groups do |t|
      t.string :name, default: ""
      t.text :profileImage
      t.text :backgroundImage
      t.string :description, default: ""
      t.timestamps null: false
    end
  end
  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
