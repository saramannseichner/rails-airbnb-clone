class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.text :description
      t.string :first_name
      t.string :last_name
      t.string :address
      t.boolean :is_artist

      t.timestamps
    end
  end
end
