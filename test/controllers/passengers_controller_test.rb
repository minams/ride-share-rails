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
    #   # nominal: it should update a book and redirect to the book show page
    #   it "will update an existing book" do
    #     # Arrange
    #     starter_input = {
    #       title: "Becoming",
    #       author_id: Author.create(name: "Michelle Obama").id,
    #       description: "A book by the 1st lady",
    #     }

    #     book_to_update = Book.create(starter_input)

    #     input_title = "99 Bottles of OOP" # Valid Title
    #     input_author = "Sandi Metz"
    #     input_description = "A look at how to design object-oriented systems"
    #     test_input = {
    #       "book": {
    #         title: input_title,
    #         author_id: Author.create(name: input_author).id,
    #         description: input_description
    #       }
    #     }

    #     # Act
    #     expect {
    #       patch book_path(book_to_update.id), params: test_input
    #   }.wont_change "Book.count"
    #   # .must_change "Book.count", 0

    #     # Assert
    #     must_respond_with :redirect
    #     book_to_update.reload
    #     expect(book_to_update.title).must_equal test_input[:book][:title]
    #     expect(book_to_update.author.name).must_equal Author.find(test_input[:book][:author_id]).name
    #     expect(book_to_update.description).must_equal test_input[:book][:description]
    #   end

    #   it "will return a bad_request (400) when asked to update with invalid data" do

    #   # Arrange
    #   starter_input = {
    #     title: "Becoming",
    #     author_id: Author.create(name: "Michelle Obama").id,
    #     description: "A book by the 1st lady",
    #   }

    #   book_to_update = Book.create(starter_input)

    #   input_title = "" # Invalid Title
    #   input_author = "Sandi Metz"
    #   input_description = "A look at how to design object-oriented systems"
    #   test_input = {
    #     "book": {
    #       title: input_title,
    #       author_id: Author.create(name: input_author).id,
    #       description: input_description
    #     }
    #   }

    #   # Act
    #   expect {
    #     patch book_path(book_to_update.id), params: test_input
    # }.wont_change "Book.count"
    # # .must_change "Book.count", 0

    #   # Assert
    #   must_respond_with :bad_request
    #   book_to_update.reload
    #   expect(book_to_update.title).must_equal starter_input[:title]
    #   expect(book_to_update.author.name).must_equal Author.find(starter_input[:author_id]).name
    #   expect(book_to_update.description).must_equal starter_input[:description]
    #   end

    #   # edge case: it should render a 404 if the book was not found
    # end
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
    it "will save a new passenger and redirect if given valid inputs" do
      input_name = "Mina Shin"
      input_phone_num = "Sandi Metz"
      test_input = {
        "passenger": {
          name: input_name,
          passenger_id: Passenger.create(name: input_name).id,
          phone_num: "2061234567",
        },
      }

      expect {
        post passengers_path, params: test_input
      }.must_change "Passenger.count", 1

      new_passenger = Passenger.find_by(name: input_name)
      expect(new_passenger).wont_be_nil
      expect(new_passenger.name).must_equal input_name
      expect(new_passenger.passenger.name).must_equal input_name
      expect(new_passenger.phone_num).must_equal input_phone_num

      must_respond_with :redirect
    end

    it "will return a 400 with an invalid passenger" do
      input_name = ""
      input_phone_num = "2061234567"
      test_input = {
        "passenger": {
          name: input_name,
          passenger_id: Passenger.create(name: input_name).id,
          phone_num: input_phone_num,
        },
      }

      expect {
        post passengers_path, params: test_input
      }.wont_change "Passenger.count"

      must_respond_with :bad_request
    end
  end

  describe "destroy" do
    it "returns a 404 if the passenger is not found" do
      invalid_id = "NOT A VALID ID"

      expect {
        delete passenger_path(invalid_id)
      }.wont_change "Passenger.count"
      must_respond_with :not_found
    end
  end

  it "can delete a passenger" do
    new_passenger = Passenger.create(name: "Mina Shin", passenger_id: Passenger.create(name: "Mina Shin").id, phone_num: "2061234567")

    expect {
      delete passenger_path(new_passenger.id)
    }.must_change "Passenger.count", -1

    must_respond_with :redirect
    must_redirect_to passengers_path
  end
end
