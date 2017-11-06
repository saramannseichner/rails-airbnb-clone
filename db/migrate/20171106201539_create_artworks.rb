class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :medium
      t.string :size
      t.text :description
      t.string :address
      t.string :artist

      t.timestamps
    end
  end
end
