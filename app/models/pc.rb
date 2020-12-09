class Pc < ApplicationRecord
  has_many :encounter_pcs
  has_many :items
  belongs_to :user
  validates :name, presence: true

  accepts_nested_attributes_for :items

  scope :ordered_by_name_asc, -> { order(name: :asc) }
  scope :ordered_by_name_desc, -> { order(name: :desc) } 
end
