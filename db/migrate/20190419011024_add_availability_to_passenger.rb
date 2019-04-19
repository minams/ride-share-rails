class AddAvailabilityToPassenger < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :availability, :string, :default => "available"
  end
end
