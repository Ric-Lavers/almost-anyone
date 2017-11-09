class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.references :tour, foreign_key: true
      t.references :user, foreign_key: true
      t.date :date
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
