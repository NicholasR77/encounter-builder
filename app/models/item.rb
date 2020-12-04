class Item < ApplicationRecord
    belongs_to :pc, optional: true
    validates :name, presence: true
end
