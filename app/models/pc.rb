class Pc < ApplicationRecord
  has_many :encounter_pcs
  has_many :items
  validates :name, presence: true

  accepts_nested_attributes_for :items
end
