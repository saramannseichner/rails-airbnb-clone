class AddStartDateToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :start_date, :string
  end
end
