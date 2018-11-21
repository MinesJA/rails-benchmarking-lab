class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors
  validates :name, uniqueness: true

  def self.ten_most_popular_slow
    # 1. Return the top 10 most prolific actors (appeared in the most films) who have appeared in the top 5 most profitable films (revenue - cost)
    # Ruby - slowest:
      @movies = Movie.sorted_profitable
      @top_movies = @movies[0..5]
      @actors = @top_movies.map{|movie| movie.actors }.flatten
      @actors.sort {|a,b| a.number_of_films - b.number_of_films}
      @actors[0..10]
  end

  def number_of_films
    self.movies.count
  end

end
