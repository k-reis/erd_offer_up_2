class Buyer < ApplicationRecord
  # Direct associations

  has_many   :messages,
             dependent: :destroy

  has_many   :items,
             dependent: :destroy

  has_many   :users,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
