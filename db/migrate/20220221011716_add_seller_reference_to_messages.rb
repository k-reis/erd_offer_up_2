class AddSellerReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :sellers
    add_index :messages, :seller_id
    change_column_null :messages, :seller_id, false
  end
end
