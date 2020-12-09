class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :notes
      t.string :rarity
      t.integer :cost
      t.integer :pc_id
      t.belongs_to :user
      t.timestamps
    end
  end
end
