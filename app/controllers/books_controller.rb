# * Using the below controller and routes files as a starting guide create a full CRUD resource for books.
# * Use the @data instance variable to hold all of your data (we will do models later), each book should have a title and an author.
# * Respond back in JSON (we will do views later)
# * Using Postman will be easier to test than the browser
# * Remember to push to github and get those green squares!

class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data

    def index
      render json: @data
    end

    #Show a single book
    def show
      string_id = params[:id]
      # => "1"
      id = string_id.to_i - 1
      # => 0
      render json: @data[id]
      # => { title: "Harry Potter", author: "J.K Rowling" }
    end

    #Create a new book
    def create
      @data << {
        title: params[:title],
        author: params[:author]
      }
      render json: @data
    end

    #Update a book
    def update
      book = @data[params[:id].to_i - 1]
      book[:title] = params[:title]
      book[:author] = params[:author]
      render json: @data
    end

    #Remove a book
    def destroy
      id = params[:id].to_i - 1
      @data.delete_at(id)
      render json: @data
    end

    private

    def setup_data
        @data = [
            { title: "Harry Potter", author: "J.K Rowling" },
            { title: "Name of the wind", author: "Patrick Rothfuss" }
        ]
    end
end
