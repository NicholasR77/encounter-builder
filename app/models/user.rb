class User < ApplicationRecord
  has_secure_password
  has_many :encounters

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password,
            presence: true,
            length: { minimum: 5, maximum: 40 },
            confirmation: true
  validates :password, confirmation: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
