class CreateCompanyContents < ActiveRecord::Migration
  def change
    create_table :company_contents do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.text :article
      t.references :company, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
