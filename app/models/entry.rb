class Entry < ApplicationRecord
  belongs_to :place   # Each entry belongs to one place
  validates :title, :description, :date, presence: true  # Ensures required fields
end
