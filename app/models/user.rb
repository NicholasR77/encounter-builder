class User < ApplicationRecord
  has_secure_password
  has_many :encounters

  validates :email, presence: true, uniqueness: true
  validates :password,
            presence: true,
            length: { minimum: 5, maximum: 40 },
            confirmation: true
  validates :password, confirmation: true

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash['info']['email']).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
