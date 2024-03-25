class CreateAdderesses < ActiveRecord::Migration[7.0]
  def change
    create_table :adderesses do |t|
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false 
      t.string :municipality, null: false
      t.string :street_address, null: false
      t.string :building_name
      t.string :telephone_number, null: false
      t.references :purchase_history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
