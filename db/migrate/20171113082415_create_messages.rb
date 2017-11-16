class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :tour, foreign_key: true
      t.references :offer, foreign_key: true
      t.references :user, foreign_key: true
      t.text :message
      t.timestamp :time
      t.boolean :read

      t.timestamps
    end
  end
end
