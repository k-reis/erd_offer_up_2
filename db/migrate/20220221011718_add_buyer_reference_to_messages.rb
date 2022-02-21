class AddBuyerReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :buyers
    add_index :messages, :buyer_id
    change_column_null :messages, :buyer_id, false
  end
end
