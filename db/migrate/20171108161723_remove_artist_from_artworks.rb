class RemoveArtistFromArtworks < ActiveRecord::Migration[5.1]
  def change
    remove_column :artworks, :artist, :string
  end
end
