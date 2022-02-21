class BuyerResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false

  # Direct associations

  has_many   :messages

  has_many   :items

  has_many   :users

  # Indirect associations

end
