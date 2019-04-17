class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, :phone_num, presence: true

  def trip_cost
    cost = 0
    self.trips.each do |trip|
      cost += trip.cost
    end
    return cost
  end
end
