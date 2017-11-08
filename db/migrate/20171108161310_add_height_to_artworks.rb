class AddHeightToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :height, :integer
  end
end
