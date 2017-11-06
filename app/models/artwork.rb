class Artwork < ApplicationRecord

  validates :name, presence: true
  validates :artist, presence: true
  validates :medium, presence: true
  validates :size, presence: true
end
