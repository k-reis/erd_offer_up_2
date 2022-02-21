class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.integer :seller_id
      t.integer :buyer_id
      t.string :name

      t.timestamps
    end
  end
end
