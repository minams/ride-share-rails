require "test_helper"

describe PassengersController do
  describe "index" do
    it "must have a successful path" do
      get passengers_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "successfully shows a valid passenger" do
      passenger = Passenger.create(name: "Mina Shin", phone_num: "2061234567")
      valid_passenger_id = passenger.id

      get passenger_path(valid_passenger_id)

      must_respond_with :success
    end

    it "should give a 404 instead of showing a non-existant invalid passenger" do
      invalid_passenger_id = 999

      expect {
        get passenger_path(invalid_passenger_id)
      }.wont_change "Passenger.count"

      must_respond_with :not_found
    end
  end

  describe "edit" do
    # not passing. issue with parameter
    it "can get the edit page for an existing passenger" do
      expect {
        get edit_passenger_path(@passenger.id)
      }.wont_change "Passenger.count"

      must_respond_with :success
    end

    it "will respond with bad request when attempting to edit a nonexistant passenger" do
      expect {
        get edit_passenger_path(-1)
      }.wont_change "Passenger.count"

      must_respond_with :not_found
    end
  end

  describe "update" do
    it "can update an existing passenger" do
      original_passenger = Passenger.create!(
        name: "new passenger",
        phone_num: "2061234567",
      )

      new_hash = {
        passenger: {
          name: "new passenger name",
        },
      }

      expect {
        patch passenger_path(original_passenger.id), params: new_hash
      }.wont_change "Passenger.count"

      original_passenger.reload
      expect(original_passenger.name).must_equal "new passenger name"
    end

    it "will respond with not found if invalid id" do
      expect {
        patch passenger_path(-1)
      }.wont_change "Passenger.count"

      must_respond_with :not_found
    end
  end

  describe "new" do
    it "can get the new passenger page" do
      get new_passenger_path

      must_respond_with :success
    end
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
