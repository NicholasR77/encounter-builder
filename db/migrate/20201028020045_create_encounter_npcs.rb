class CreateEncounterNpcs < ActiveRecord::Migration[6.0]
  def change
    create_table :encounter_npcs do |t|
      t.belongs_to :npc
      t.belongs_to :encounter
      t.integer :turn_order
      t.timestamps
    end
  end
end
