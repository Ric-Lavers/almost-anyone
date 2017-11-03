class CreateJoinTableProfileGenre < ActiveRecord::Migration[5.1]
  def change
    create_join_table :profiles, :genres do |t|
      t.index [:profile_id, :genre_id]
      t.index [:genre_id, :profile_id]
    end
  end
end
