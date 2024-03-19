class BooksController < ApplicationController
  def index
    @books = Book.all
    @books = @books.where(genre: params[:genre]) if params[:genre].present?
    @books = @books.where("LOWER(title) LIKE ?", "%#{params[:query].downcase}%") if params[:query].present?
    @books = @books.page(params[:page]).per(10)
  end

  def show
    @book = Book.find(params[:id])
  end

  def show_by_author
    @books = Book.where(author: params[:author_name]).page(params[:page]).per(10).distinct
    render :index
  end

  def show_by_genre
    puts "Received genre parameter: #{params[:genre]}"
    @books = Book.where(genre: params[:genre]).page(params[:page]).per(10).distinct
    render :index
  end

  def show_by_publisher
    @books = Book.where(publisher: params[:publisher]).page(params[:page]).per(10).distinct
    render :index
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :publisher)
  end
end
