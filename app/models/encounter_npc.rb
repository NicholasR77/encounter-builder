class EncounterNpc < ApplicationRecord
  belongs_to :encounter
  belongs_to :npc
end
