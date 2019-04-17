require "test_helper"

describe PassengersController do
  describe "index" do
    get passengers_index_url
    must_respond_with :success
  end

  describe "show" do
    get passengers_show_url
    must_respond_with :success
  end

  describe "edit" do
    get passengers_edit_url
    must_respond_with :success
  end

  describe "update" do
    get passengers_update_url
    must_respond_with :success
  end

  describe "new" do
    get passengers_new_url
    must_respond_with :success
  end

  describe "create" do
    get passengers_create_url
    must_respond_with :success
  end

  describe "destroy" do
    get passengers_destroy_url
    must_respond_with :success
  end
end
