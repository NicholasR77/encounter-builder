class Npc < ApplicationRecord
  has_many :encounter_npcs
  belongs_to :user
  validates :name, presence: true

  scope :ordered_by_name_asc, -> { order(name: :asc) }
  scope :ordered_by_name_desc, -> { order(name: :desc) } 
end
