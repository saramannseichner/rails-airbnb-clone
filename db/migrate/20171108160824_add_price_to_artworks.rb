class AddPriceToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :price, :integer
  end
end
