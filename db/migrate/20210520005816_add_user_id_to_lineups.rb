class AddUserIdToLineups < ActiveRecord::Migration[6.1]
  def change
    add_column :lineups, :user_id, :integer
  end
end
