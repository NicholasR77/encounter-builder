class Encounter < ApplicationRecord
  has_many :encounter_npcs
  has_many :npcs, through: :encounter_npcs

  has_many :encounter_pcs
  has_many :pcs, through: :encounter_pcs

  validates :name, presence: true

  def pcs_attributes=(pc_attributes)
    pc_attributes.values.each do |pc_attribute|
      pc = Pc.find_or_create_by(pc_attribute)
      self.pcs << pc
    end
  end
end
