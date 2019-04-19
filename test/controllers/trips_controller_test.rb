require "test_helper"

describe TripsController do
  let (:driver) do
    Driver.where(status: "available").sample
  end

  let (:trip) do
    Trip.create(passenger: Passenger.first, date: Date.today, rating: 4, driver: driver, cost: 1000)
  end

  describe "show" do
    it "successfully shows a valid trip" do
      valid_trip_id = trip.id

      get trip_path(valid_trip_id)

      must_respond_with :success
    end
  end

  describe "edit" do
    it "can get the edit page for an existing trip" do
      get edit_trip_path(trip.id)

      must_respond_with :success
    end
  end

  describe "update" do
    new_hash = {
      trip: {
        passenger: Passenger.first,
        date: Date.today,
        rating: 2,
        driver: Driver.first,
        cost: 1000,
      },
    }
    it "can update an existing trip" do
      id = trip.id
      expect {
        patch trip_path(id), params: new_hash
      }.wont_change "Trip.count"

      trip.reload
      expect(trip.rating).must_equal 2
    end

    it "will respond with not found if invalid id" do
      expect {
        patch trip_path(-1), params: new_hash
      }.wont_change "Trip.count"

      must_respond_with :not_found
    end
  end
end
#   describe "new" do
#     it "can get the new trip page" do
#       get new_trip_path

#       must_respond_with :success
#     end
#   end

#   describe "create" do
#     it "will save a new trip and redirect if given valid inputs" do
#       input_name = "Mina Shin"
#       test_input = {
#         "trip": {
#           name: input_name,
#           vin: "2061234567",
#         },
#       }

#       expect {
#         post trips_path, params: test_input
#       }.must_change "trip.count", 1

#       new_trip = trip.find_by(name: input_name)
#       expect(new_trip).wont_be_nil
#       expect(new_trip.name).must_equal input_name
#       expect(new_trip.vin).must_equal "2061234567"

#       must_respond_with :redirect
#     end

#     it "will return a 400 with an invalid trip" do
#       input_name = ""
#       input_vin = "2061234567"
#       test_input = {
#         "trip": {
#           name: input_name,
#           vin: input_vin,
#         },
#       }

#       expect {
#         post trips_path, params: test_input
#       }.wont_change "trip.count"

#       must_respond_with :bad_request
#     end
#   end

#   describe "destroy" do
#     it "returns a 404 if the trip is not found" do
#       invalid_id = "NOT A VALID ID"

#       expect {
#         delete trip_path(invalid_id)
#       }.wont_change "trip.count"
#       must_respond_with :not_found
#     end

#     it "can delete a trip" do
#       new_trip = Trip.create(name: "Mina Shin", vin: "2061234567")

#       expect {
#         delete trip_path(new_trip.id)
#       }.must_change "trip.count", -1

#       must_respond_with :redirect
#       must_redirect_to trips_path
#     end
#   end
# end
