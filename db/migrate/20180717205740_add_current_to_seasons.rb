class AddCurrentToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :current, :boolean
  end
end
