require "test_helper"

describe TripsController do
  let (:trip) do
    Trip.create(passenger_id: "passenger_id", date: "04/18/19", rating: "4", driver_id: "driver_id")
  end

  describe "index" do
    it "must have a successful path" do
      get trips_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "successfully shows a valid trip" do
      valid_trip_id = trip.id

      get trip_path(valid_trip_id)

      must_respond_with :success
    end

    it "should give a 404 instead of showing a non-existant invalid trip" do
      invalid_trip_id = 999

      expect {
        get trip_path(invalid_trip_id)
      }.wont_change "Trip.count"

      must_respond_with :not_found
    end
  end

  #   describe "edit" do
  #     it "can get the edit page for an existing trip" do
  #       get edit_trip_path(trip.id)

  #       must_respond_with :success
  #     end

  #     it "will respond with bad request when attempting to edit a nonexistant trip" do
  #       expect {
  #         get edit_trip_path(-1)
  #       }.wont_change "trip.count"

  #       must_respond_with :not_found
  #     end
  #   end

  #   describe "update" do
  #     new_hash = {
  #       trip: {
  #         name: "new trip name",
  #         vin: "2061234567",
  #       },
  #     }

  #     it "can update an existing trip" do
  #       original_trip = trip.create!(
  #         name: "new trip",
  #         vin: "2061234567",
  #       )

  #       expect {
  #         patch trip_path(original_trip.id), params: new_hash
  #       }.wont_change "trip.count"

  #       original_trip.reload
  #       expect(original_trip.name).must_equal "new trip name"
  #     end

  #     it "will respond with not found if invalid id" do
  #       expect {
  #         patch trip_path(-1), params: new_hash
  #       }.wont_change "trip.count"

  #       must_respond_with :not_found
  #     end
  #   end

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
end
