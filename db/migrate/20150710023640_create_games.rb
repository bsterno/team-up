class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :user, null: false
      t.string :name, null: false
      t.belongs_to :sport, null: false
      t.string :street_address, null: false
      t.string :city, null: false
      t.datetime :start_date, null: false
      t.integer :max_players, null: false

      t.timestamps null: false
    end
  end
end
