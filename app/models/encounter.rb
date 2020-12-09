class Encounter < ApplicationRecord
  belongs_to :user

  has_many :encounter_npcs
  has_many :npcs, through: :encounter_npcs

  has_many :encounter_pcs
  has_many :pcs, through: :encounter_pcs

  validates :name, presence: true
  accepts_nested_attributes_for :pcs, :npcs, reject_if: proc { |attributes| attributes['name'].blank? }

  scope :ordered_by_name_asc, -> { order(name: :asc) }
  scope :ordered_by_name_desc, -> { order(name: :desc) } 
end
