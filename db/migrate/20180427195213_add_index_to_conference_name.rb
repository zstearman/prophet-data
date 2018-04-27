class AddIndexToConferenceName < ActiveRecord::Migration[5.2]
  def change
    add_index :conferences, :name
  end
end
