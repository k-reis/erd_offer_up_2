class Item < ApplicationRecord
  # Direct associations

  belongs_to :category

  has_many   :messages,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end
