class CreateEncounterPcs < ActiveRecord::Migration[6.0]
  def change
    create_table :encounter_pcs do |t|
      t.belongs_to :pc
      t.belongs_to :encounter
      t.integer :turn_order, default: 0
      t.timestamps
    end
  end
end
