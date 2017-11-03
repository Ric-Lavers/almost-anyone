class CreateJoinTableTourGenre < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tours, :genres do |t|
      t.index [:tour_id, :genre_id]
      t.index [:genre_id, :tour_id]
    end
  end
end
