class AddBuyerReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :buyers
    add_index :users, :buyer_id
    change_column_null :users, :buyer_id, false
  end
end
