class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :brand
      t.string :location
      t.string :phone_number
      t.text :image_data
      t.text :bio

      t.timestamps
    end
  end
end
