class User < ApplicationRecord
  # Direct associations

  belongs_to :buyer

  belongs_to :seller

  # Indirect associations

  has_one    :item,
             :through => :seller,
             :source => :items

  has_one    :message,
             :through => :item,
             :source => :messages

  # Validations

  # Scopes

  def to_s
    email
  end

end
