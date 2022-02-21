class Item < ApplicationRecord
  # Direct associations

  has_many   :messages,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end
