require 'csv'

class Movie < ApplicationRecord
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :ratings

  has_many :keyword_movies
  has_many :keywords, through: :keyword_movies

  validates :title, uniqueness: true

  def self.seed_movies
    CSV.foreach("db/the-movies-dataset/tmdb_5000_movies.csv") do |row|
      # ["budget", "genres", "homepage", "id", "keywords", "original_language", "original_title", "overview", "popularity", "production_companies", "production_countries", "release_date", "revenue", "runtime", "spoken_languages", "status", "tagline", "title", "vote_average", "vote_count"]
      budget, genres, homepage, id, keywords, original_language, original_title, overview, popularity, production_companies, production_countries, release_date, revenue, runtime, spoken_languages, status, tagline, title, vote_average, vote_count = row

      @movie = Movie.new(
        title: original_title,
        overview: overview,
        tagline: tagline,
        runtime: runtime,
        popularity: popularity.to_f,
        original_language: original_language,
        budget: budget.to_i,
        revenue: revenue.to_i,
        vote_count: vote_count,
        vote_average: vote_average.to_f,
        status: status
      )

      @movie.id = id
      if @movie.save
        puts "Created #{@movie.title}"
        Keyword.process(keywords, movie)

      

    end
  end









end
