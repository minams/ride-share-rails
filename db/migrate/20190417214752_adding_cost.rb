class AddingCost < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :cost, :integer
  end
end
