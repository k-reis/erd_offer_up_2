class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :seller_id, :integer
  attribute :buyer_id, :integer
  attribute :item_id, :integer

  # Direct associations

  # Indirect associations

end
