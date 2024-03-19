# app/models/user.rb
class User < ApplicationRecord
    has_many :reviews
    has_many :favorites
    has_many :books, through: :favorites
  
    validates :username, :email, presence: true
    validates :email, uniqueness: true
  end