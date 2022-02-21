class Item < ApplicationRecord
  # Direct associations

  belongs_to :buyer

  belongs_to :seller

  belongs_to :category

  has_many   :messages,
             dependent: :destroy

  # Indirect associations

  has_one    :user,
             through: :seller,
             source: :users

  # Validations

  # Scopes

  def to_s
    title
  end
end
