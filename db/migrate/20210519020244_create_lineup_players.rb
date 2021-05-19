class CreateLineupPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :lineup_players do |t|
      t.integer :lineup_id
      t.integer :player_id

      t.timestamps
    end
  end
end
