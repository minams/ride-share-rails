class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, :vin, presence: true

  def money_earned
    money = 0

    trips.each do |trip|
      money += trip.cost
    end
    total_money = (0.85 * money)
    return total_money
  end

  def average_rating
    rating = 0
    no_rating = 0

    trips.each do |trip|
      if trip.rating == nil
        no_rating += 1
      else
        rating += trip.rating
      end
    end

    rated_trips = trips.count - no_rating

    average = (rating / rated_trips).to_f
    return average.round(1)
  end
end
