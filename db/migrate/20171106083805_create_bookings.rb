class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :tour, foreign_key: true
      t.timestamp :date

      t.timestamps
    end
  end
end
