class Movie < ApplicationRecord
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :keyword_movies
  has_many :keywords, through: :keyword_movies



end
