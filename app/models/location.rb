class Location < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :albums, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
