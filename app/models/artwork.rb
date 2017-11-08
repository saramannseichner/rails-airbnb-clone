class Artwork < ApplicationRecord
  has_many :reservations
  has_many :users, through: :users
  has_attachment :photo

  validates :name, presence: true
  validates :artist, presence: true
  validates :medium, presence: true
  validates :height, presence: true
  validates :width, presence: true
  validates :price, presence: true

 # class method that allows for searches of artwork
 # add lines based on fields in the database
 # used with index in artworks controller
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("height LIKE ?", "%#{search}%")
    where("artist LIKE ?","%#{search}%")
    where("medium LIKE ?","%#{search}%")
    where("price LIKE ?","%#{search}%")
    where("width LIKE ?","%#{search}%")
  end
end
