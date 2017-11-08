class AddPriceToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_coloum :artworks, :price, :integer
  end
end
