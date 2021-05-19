class CreateLineups < ActiveRecord::Migration[6.1]
  def change
    create_table :lineups do |t|
      t.string :name

      t.timestamps
    end
  end
end
