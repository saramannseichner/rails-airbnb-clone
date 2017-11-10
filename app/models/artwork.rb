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
  validates :photo, presence: true

  def self.mediums
    [['Painting', ['Oil', 'Acrylic', 'Watercolor', 'Gouache', 'Tempera', 'Fresco painting', 'Murals']],
    ['Drawing', ['Charcoal', 'Graphite', 'Pencil', 'Pen and Ink', 'India Ink', 'Pastel', 'Marker', 'Chalk']],
    ['Printing', ['Screen', 'Mono', 'Block', 'Etching', 'Lithography', 'Spraypaint', 'Airbrush']],
    ['Sculpture', ['Pottery', 'Ceramic', 'Wood', 'Glass', 'Metal', 'Wax', 'Stone', 'Butter']],
    ['Textile', ['Weaving', 'Macrame', 'Stamping']],
    ['Photography', ['Black and White', 'Digital', 'Photoshop', 'Graphic Design', 'Video Art']],
    ['Other', ['Mixed Media', 'Collage', 'Paper Cutting']]
    ]
  end
 # class method that allows for searches of artwork
 # add lines based on fields in the database
 # used with index in artworks controller
  def self.search(query)
    query.downcase!
    if
      where(["lower(medium) = ? OR lower(name) = ?", query, query])
    else
      find(:all)
    end
  end
end

    # if query == "painting"
    #   results = []
    #   mediums = Artwork.mediums[0]
    #   mediums.each do |medium|
    #     results << where(["lower(medium) = ?", medium])
    #   end
    #   return results
