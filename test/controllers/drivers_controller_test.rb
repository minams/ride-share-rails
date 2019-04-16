require "test_helper"

describe DriversController do
  it "can get index" do
    get drivers_index_url
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
    get dr
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
