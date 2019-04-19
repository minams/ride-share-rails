class DeleteAvailabilityColumnFromTrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :availability
  end
end
