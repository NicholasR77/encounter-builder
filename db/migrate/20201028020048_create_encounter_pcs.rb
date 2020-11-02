class CreateEncounterPcs < ActiveRecord::Migration[6.0]
  def change
    create_table :encounter_pcs do |t|
      t.belongs_to :pc
      t.belongs_to :encounter
      t.timestamps
    end
  end
end
