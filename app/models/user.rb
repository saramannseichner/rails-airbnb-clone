class User < ApplicationRecord
  has_many :reservations
  has_many :artworks, through: :reservations
  has_attachment :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  def is_artist?
    self.is_artist
  end
end
