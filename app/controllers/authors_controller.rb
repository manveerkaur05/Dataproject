class AuthorsController < ApplicationController
  def show
    @books = Book.where(author: params[:author])
  end
end
