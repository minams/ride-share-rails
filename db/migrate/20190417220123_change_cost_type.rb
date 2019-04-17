class ChangeCostType < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :cost
  end
end
