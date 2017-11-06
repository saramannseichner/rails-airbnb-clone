class ChangeDefaultIsArtistToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :is_artist, false
  end
end
