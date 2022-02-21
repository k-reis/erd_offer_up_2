class Message < ApplicationRecord
  # Direct associations

  belongs_to :buyer

  belongs_to :seller

  belongs_to :item

  # Indirect associations

  has_one    :user,
             :through => :item,
             :source => :user

  # Validations

  # Scopes

  def to_s
    seller.to_s
  end

end
