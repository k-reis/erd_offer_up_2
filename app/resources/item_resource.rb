class ItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :price, :string
  attribute :description, :string
  attribute :category_id, :integer
  attribute :location, :string
  attribute :image, :string
  attribute :seller_id, :integer
  attribute :buyer_id, :integer

  # Direct associations

  # Indirect associations

end
