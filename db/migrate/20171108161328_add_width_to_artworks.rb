class AddWidthToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :width, :integer
  end
end
