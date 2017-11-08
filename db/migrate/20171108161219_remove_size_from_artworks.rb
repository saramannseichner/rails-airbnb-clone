class RemoveSizeFromArtworks < ActiveRecord::Migration[5.1]
  def change
    remove_column :artworks, :size, :string
  end
end
