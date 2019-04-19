class AddAvailability < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :availability, :string, :default => "Available"
  end
end
