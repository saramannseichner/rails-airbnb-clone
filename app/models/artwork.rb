class Artwork < ApplicationRecord
  has_many :reservations
  has_many :users, through: :users
  has_attachment :photo

  validates :name, presence: true
  validates :artist, presence: true
  validates :medium, presence: true
  validates :size, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
