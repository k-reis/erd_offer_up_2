class AddSellerReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :sellers
    add_index :users, :seller_id
    change_column_null :users, :seller_id, false
  end
end
