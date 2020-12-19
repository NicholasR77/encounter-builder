class Encounter < ApplicationRecord
  belongs_to :user

  has_many :encounter_npcs
  has_many :npcs, through: :encounter_npcs

  has_many :encounter_pcs
  has_many :pcs, through: :encounter_pcs

  validates :name, presence: true
  accepts_nested_attributes_for :pcs, :npcs, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :encounter_npcs

  # Refactor to be more DRY
  scope :ordered_by_name_asc, -> { order(name: :asc) }
  scope :ordered_by_name_desc, -> { order(name: :desc) }

  def encounter_npcs_attributes=(attr_hashes)
    attr_hashes.values.each do |attr_hash|
      if !attr_hash['turn_order'].blank? && EncounterNpc.exists?(attr_hash['id'])
        encounter_npc = EncounterNpc.find(attr_hash['id'])
        if encounter_npc
          encounter_npc.turn_order = attr_hash['turn_order']
          encounter_npc.save
        end
      end
      
    end
  end

end
