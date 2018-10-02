class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.text :description
      t.string :span, default: ""
      t.boolean :regular
      t.boolean :direct
      t.timestamps null: false
    end
  end
end
