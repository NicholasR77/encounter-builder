class Encounter < ApplicationRecord
  has_many :encounter_npcs
  has_many :npcs, through: :encounter_npcs

  has_many :encounter_pcs
  has_many :pcs, through: :encounter_pcs

  validates :name, presence: true
  accepts_nested_attributes_for :pcs, :npcs, reject_if: proc { |attributes| attributes['name'].blank? }
end
