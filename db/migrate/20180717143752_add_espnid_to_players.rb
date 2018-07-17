class AddEspnidToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :espn_id, :integer
  end
end
