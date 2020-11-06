class Pc < ApplicationRecord
  has_many :encounter_pcs

  validates :name, presence: true
end
