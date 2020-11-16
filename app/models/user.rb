class User < ApplicationRecord
  has_many :encounters

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
    presence: true, 
    uniqueness: true,
    format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password,
    presence: true,
    length: { minimum: 5, maximum: 40 },
    confirmation: true,
    allow_nil: true

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash['info']['email']).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
