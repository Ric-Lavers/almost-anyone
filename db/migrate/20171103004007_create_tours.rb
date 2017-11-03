class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.string :country, :default => 'Australia'
      t.text :image_data
      t.text :bio
      t.timestamp :start_date
      t.timestamp :end_date
      t.integer :min_cost
      t.integer :max_cost

      t.timestamps
    end
  end
end
