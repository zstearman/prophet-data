class ChangePositionToIntegerInPlayers < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :position, :string
  end
end
