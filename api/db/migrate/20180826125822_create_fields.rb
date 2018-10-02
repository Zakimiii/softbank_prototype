class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name, default: "", null: false
      t.timestamps null: false
    end
    add_reference :fieldings, :field, index: true, null: false
  end
end
