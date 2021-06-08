class Location < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :albums
  accepts_nested_attributes_for :albums
  accepts_nested_attributes_for :comments
end
