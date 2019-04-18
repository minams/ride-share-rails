require "test_helper"

describe DriversController do
  let (:driver) do
    Driver.create(name: "Name", vin: "1234567890ABC")
  end

  describe "index" do
    it "must have a successful path" do
      get drivers_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "successfully shows a valid driver" do
      valid_driver_id = driver.id

      get driver_path(valid_driver_id)

      must_respond_with :success
    end

    it "should give a 404 instead of showing a non-existant invalid driver" do
      invalid_driver_id = 999

      expect {
        get driver_path(invalid_driver_id)
      }.wont_change "Driver.count"

      must_respond_with :not_found
    end
  end

  describe "edit" do
    it "can get the edit page for an existing driver" do
      get edit_driver_path(driver.id)

      must_respond_with :success
    end

    it "will respond with bad request when attempting to edit a nonexistant driver" do
      expect {
        get edit_driver_path(-1)
      }.wont_change "Driver.count"

      must_respond_with :not_found
    end
  end

  describe "update" do
    new_hash = {
      driver: {
        name: "new driver name",
        vin: "2061234567",
      },
    }

    it "can update an existing driver" do
      original_driver = Driver.create!(
        name: "new driver",
        vin: "2061234567",
      )

      expect {
        patch driver_path(original_driver.id), params: new_hash
      }.wont_change "Driver.count"

      original_driver.reload
      expect(original_driver.name).must_equal "new driver name"
    end

    it "will respond with not found if invalid id" do
      expect {
        patch driver_path(-1), params: new_hash
      }.wont_change "Driver.count"

      must_respond_with :not_found
    end
  end

  describe "new" do
    it "can get the new driver page" do
      get new_driver_path

      must_respond_with :success
    end
  end

  describe "create" do
    it "will save a new driver and redirect if given valid inputs" do
      input_name = "Mina Shin"
      test_input = {
        "driver": {
          name: input_name,
          vin: "2061234567",
        },
      }

      expect {
        post drivers_path, params: test_input
      }.must_change "Driver.count", 1

      new_driver = Driver.find_by(name: input_name)
      expect(new_driver).wont_be_nil
      expect(new_driver.name).must_equal input_name
      expect(new_driver.vin).must_equal "2061234567"

      must_respond_with :redirect
    end

    it "will return a 400 with an invalid driver" do
      input_name = ""
      input_vin = "2061234567"
      test_input = {
        "driver": {
          name: input_name,
          vin: input_vin,
        },
      }

      expect {
        post drivers_path, params: test_input
      }.wont_change "Driver.count"

      must_respond_with :bad_request
    end
  end

  describe "destroy" do
    it "returns a 404 if the driver is not found" do
      invalid_id = "NOT A VALID ID"

      expect {
        delete driver_path(invalid_id)
      }.wont_change "Driver.count"
      must_respond_with :not_found
    end
  end

  it "can delete a driver" do
    new_driver = Driver.create(name: "Mina Shin", vin: "2061234567")

    expect {
      delete driver_path(new_driver.id)
    }.must_change "Driver.count", -1

    must_respond_with :redirect
    must_redirect_to drivers_path
  end
end
