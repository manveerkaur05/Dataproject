# app/controllers/genres_controller.rb
class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @books = @genre.books
  end
end
