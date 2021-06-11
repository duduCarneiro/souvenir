class Album < ApplicationRecord
  belongs_to :location
  has_many_attached :photos
  # validates :photos, presence: true
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :date ],
    associated_against: {
      location: [ :address, :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
