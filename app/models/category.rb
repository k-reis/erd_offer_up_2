class Category < ApplicationRecord
  # Direct associations

  has_many   :items,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category_name
  end
end
