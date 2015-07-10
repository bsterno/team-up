class CreateLobbies < ActiveRecord::Migration
  def change
    create_table :lobbies do |t|
      t.belongs_to :user
      t.string :game, null: false
      t.string :name, null: false
      t.integer :max_players

      t.timestamps null: false
    end
  end
end
