class Book < ApplicationRecord
  # Associations
  has_many :reviews
  has_many :favorites
  has_many :users, through: :favorites

  # Validations
  validates :title, :genre, :height, :publisher, :author, presence: true

  # Search method to filter books by title and genre
  def self.search(query, genre)
    books = all
    books = books.where("title LIKE ?", "%#{query.downcase}%") if query.present?
    books = books.where(genre: genre) if genre.present?
    books
  end 
end
