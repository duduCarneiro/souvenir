class Location < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :albums, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :address, :name ],
    associated_against: {
      albums: [ :date ]
    },
    using: {
      tsearch: { prefix: true }
    }

  accepts_nested_attributes_for :albums , reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
end
