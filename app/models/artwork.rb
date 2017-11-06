class Artwork < ApplicationRecord
  has_many :reservations
  has_many :users, through: :users

  validates :name, presence: true
  validates :artist, presence: true
  validates :medium, presence: true
  validates :size, presence: true
end
