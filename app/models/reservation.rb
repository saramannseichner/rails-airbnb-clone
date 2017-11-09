class Reservation < ApplicationRecord
  belongs_to :artwork
  belongs_to :user

  validates :artwork, presence: true
  validates :user, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def self.status
    ['Approved', 'Pending', 'Declined']
  end
end
