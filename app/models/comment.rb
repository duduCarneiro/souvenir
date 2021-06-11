class Comment < ApplicationRecord
  belongs_to :location
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
