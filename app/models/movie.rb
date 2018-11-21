class Movie < ApplicationRecord
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :keyword_movies
  has_many :keywords, through: :keyword_movies

  def self.sorted_profitable
    Movie.all.sort {|a,b| a.profitable - b.profitable}
  end

  def profitable
    self.revenue - self.budget
  end

end
