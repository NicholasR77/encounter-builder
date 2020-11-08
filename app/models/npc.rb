class Npc < ApplicationRecord
  has_many :encounter_npcs

  validates :name, presence: true
end
