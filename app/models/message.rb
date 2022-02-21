class Message < ApplicationRecord
  # Direct associations

  belongs_to :buyer

  belongs_to :seller

  belongs_to :item

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    seller.to_s
  end

end
