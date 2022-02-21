class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :seller_id, :integer
  attribute :buyer_id, :integer
  attribute :name, :string

  # Direct associations

  belongs_to :buyer

  belongs_to :seller

  # Indirect associations

end
