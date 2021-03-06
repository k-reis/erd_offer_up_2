class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :seller_id, :integer
  attribute :buyer_id, :integer
  attribute :item_id, :integer

  # Direct associations

  belongs_to :buyer

  belongs_to :seller

  belongs_to :item

  # Indirect associations

  has_one    :user
end
