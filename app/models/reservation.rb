class Reservation < ApplicationRecord
  belongs_to :artwork
  belongs_to :user

  validates :artwork, presence: true
  validates :user, presence: true
  validates :date, presence: true
end
