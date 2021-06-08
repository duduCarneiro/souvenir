class Album < ApplicationRecord
  belongs_to :location
  has_many_attached :photos
  # validates :photos, presence: true
end
