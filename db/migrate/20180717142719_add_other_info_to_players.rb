class AddOtherInfoToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :first_name, :string
    add_column :players, :number, :integer
    add_column :players, :position, :integer
    add_column :players, :height, :integer
    add_column :players, :weight, :integer
    add_column :players, :year, :string
    add_column :players, :hometown, :string
    add_reference :players, :team, foreign_key: true
  end
end
