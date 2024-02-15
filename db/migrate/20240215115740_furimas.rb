class Furimas < ActiveRecord::Migration[5.2]
  def change
    create_table :furimas do |t|
      t.timestamps
    end
  end
end