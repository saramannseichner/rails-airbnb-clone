class AddUserRefToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_reference :artworks, :user, foreign_key: true
  end
end
