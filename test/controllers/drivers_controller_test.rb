require "test_helper"

describe DriversController do
  it "can get index" do
    get drivers_path
    must_respond_with :success
  end

  describe "show" do
    get drivers_show_url
    must_respond_with :success
  end

  describe "edit" do
    get drivers_edit_url
    must_respond_with :success
  end

  describe "update" do
    get drivers_update_url
    must_respond_with :success
  end

  describe "new" do
    get drivers_new_url
    must_respond_with :success
  end

  describe "create" do
    get drivers_create_url
    must_respond_with :success
  end

  describe "destroy" do
    get drivers_destroy_url
    must_respond_with :success
  end
end
