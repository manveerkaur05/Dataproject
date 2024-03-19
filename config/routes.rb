Rails.application.routes.draw do
  # Route for showing authors
  get '/authors/:author_name', to: 'authors#show', as: :author

  # Route for showing books by genre
  get '/books/by_genre', to: 'books#show_by_genre', as: :books_by_genre

  # Route for showing books by publisher
  get '/publishers/:publisher', to: 'books#show_by_publisher', as: :books_by_publisher

  # Route for searching books
  get '/books/search', to: 'books#search', as: :book_search

  # Existing route for showing books by author
  get '/authors/:author_name/books', to: 'books#show_by_author', as: :books_by_author

  # Resourceful routes for genres, books, favorites, users, and other paths
  resources :genres, only: [:show]
  resources :books, only: [:index, :show] do
    resources :reviews, only: [:create, :new]
  end
  resources :favorites, only: [:new, :create]
  resources :users, only: [:show]

  # Other routes...
  root 'books#index'
  get 'about', to: 'about#index'
  get 'collection', to: 'books#collection'
end
