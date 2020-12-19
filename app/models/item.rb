class Item < ApplicationRecord
    belongs_to :pc, optional: true
    validates :name, presence: true

    scope :ordered_by_name_asc, -> { order(name: :asc) }
    scope :ordered_by_name_desc, -> { order(name: :desc) }

    scope :find_items, -> (name) { where('name LIKE ?', "%#{name}%") }
end
