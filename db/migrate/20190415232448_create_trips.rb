class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :date
      t.integer :rating

      t.timestamps
    end
  end
end
