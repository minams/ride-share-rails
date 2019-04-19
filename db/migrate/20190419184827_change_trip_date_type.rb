class ChangeTripDateType < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :date
    add_column :trips, :date, :date
  end
end
