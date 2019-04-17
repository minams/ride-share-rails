require "test_helper"

describe TripsController do
  describe "show" do
    get trips_show_url
    must_respond_with :success
  end

  describe "edit" do
    get trips_edit_url
    must_respond_with :success
  end

  describe "update" do
    get trips_update_url
    must_respond_with :success
  end

  describe "create" do
    get trips_create_url
    must_respond_with :success
  end

  describe "destroy" do
    get trips_destroy_url
    must_respond_with :success
  end
end
