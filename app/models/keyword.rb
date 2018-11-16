class Keyword < ApplicationRecord
  has_many :keyword_movies
  has_many :movies, through: :keyword_movies
  validates :name, uniqueness: true


end
