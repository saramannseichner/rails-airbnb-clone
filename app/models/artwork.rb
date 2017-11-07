class Artwork < ApplicationRecord
  has_many :reservations
  has_many :users, through: :users
  has_attachment :photo

  validates :name, presence: true
  validates :artist, presence: true
  validates :medium, presence: true
  validates :size, presence: true
end
