class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :item_id

      t.timestamps
    end
  end
end
