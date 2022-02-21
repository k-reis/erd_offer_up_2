class User < ApplicationRecord
  # Direct associations

  belongs_to :seller

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

end
