class ChangeAdderessesToAddresses < ActiveRecord::Migration[7.0]
  def change
    rename_table :adderesses, :addresses
  end
end
