class CreateNpcs < ActiveRecord::Migration[6.0]
  def change
    create_table :npcs do |t|
      t.string :name
      t.string :description
      t.belongs_to :encounter
      t.timestamps
    end
  end
end
