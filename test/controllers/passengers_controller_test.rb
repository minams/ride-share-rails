# require "test_helper"

# describe PassengersController do
#   let (:passenger) do
#     Passenger.create(name: "Name", phone_num: "1234567890")
#   end

#   describe "index" do
#     it "must have a successful path" do
#       get passengers_path
#       must_respond_with :success
#     end
#   end

#   describe "show" do
#     it "successfully shows a valid passenger" do
#       valid_passenger_id = passenger.id

#       get passenger_path(valid_passenger_id)

#       must_respond_with :success
#     end
#   end

#   it "should give a 404 instead of showing a non-existant invalid passenger" do
#     invalid_passenger_id = 999

#     expect {
#       get passenger_path(invalid_passenger_id)
#     }.wont_change "Passenger.count"

#     must_respond_with :not_found
#   end

#   describe "edit" do
#     it "can get the edit page for an existing passenger" do
#       get edit_passenger_path(passenger.id)

#       must_respond_with :success
#     end

#     it "will respond with bad request when attempting to edit a nonexistant passenger" do
#       expect {
#         get edit_passenger_path(-1)
#       }.wont_change "Passenger.count"

#       must_respond_with :not_found
#     end
#   end

#   describe "update" do
#     new_hash = {
#       passenger: {
#         name: "new passenger name",
#         phone_num: "2061234567",
#       },
#     }
#     it "can update an existing passenger" do
#       original_passenger = Passenger.create!(
#         name: "new passenger",
#         phone_num: "2061234567",
#       )
#       expect {
#         patch passenger_path(original_passenger.id), params: new_hash
#       }.wont_change "Passenger.count"

#       original_passenger.reload
#       expect(original_passenger.name).must_equal "new passenger name"
#     end

#     it "will respond with not found if invalid id" do
#       expect {
#         patch passenger_path(-1), params: new_hash
#       }.wont_change "Passenger.count"

#       must_respond_with :not_found
#     end
#   end

#   describe "new" do
#     it "can get the new passenger page" do
#       get new_passenger_path

#       must_respond_with :success
#     end
#   end

#   describe "create" do
#     it "will save a new passenger and redirect if given valid inputs" do
#       input_name = "Mina Shin"
#       test_input = {
#         "passenger": {
#           name: input_name,
#           phone_num: "2061234567",
#         },
#       }

#       expect {
#         post passengers_path, params: test_input
#       }.must_change "Passenger.count", 1

#       new_passenger = Passenger.find_by(name: input_name)
#       expect(new_passenger).wont_be_nil
#       expect(new_passenger.name).must_equal input_name
#       expect(new_passenger.phone_num).must_equal "2061234567"

#       must_respond_with :redirect
#     end
#   end

#   it "will return a 400 with an invalid passenger" do
#     input_name = ""
#     input_phone_num = "2061234567"
#     test_input = {
#       "passenger": {
#         name: input_name,
#         phone_num: input_phone_num,
#       },
#     }

#     expect {
#       post passengers_path, params: test_input
#     }.wont_change "Passenger.count"

#     must_respond_with :bad_request
#   end

#   describe "destroy" do
#     it "returns a 404 if the passenger is not found" do
#       invalid_id = "NOT A VALID ID"

#       expect {
#         delete passenger_path(invalid_id)
#       }.wont_change "Passenger.count"
#       must_respond_with :not_found
#     end
#   end

#   it "can delete a passenger" do
#     new_passenger = Passenger.create(name: "Mina Shin", phone_num: "2061234567")

#     expect {
#       delete passenger_path(new_passenger.id)
#     }.must_change "Passenger.count", -1

#     must_respond_with :redirect
#     must_redirect_to passengers_path
#   end
# end
