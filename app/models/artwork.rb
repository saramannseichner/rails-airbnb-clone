class Artwork < ApplicationRecord
  has_many :reservations
  has_many :users, through: :users
  has_attachment :photo

  validates :name, presence: true
  validates :user_id, presence: true
  validates :medium, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :height, presence: true
  validates :width, presence: true
  validates :price, presence: true
  validates :address, presence: true
 # class method that allows for searches of artwork
 # add lines based on fields in the database
 # used with index in artworks controller
  def self.search(query)
    query.downcase!
    if query
      where(["lower(medium) = ? OR lower(name) = ?", query, query])
    else
      find(:all)
    end
  end
end


# (:all, :conditions => ['name LIKE ? OR medium LIKE ?', "%#{query}%"])
