require 'csv'

class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors
  validates :name, uniqueness: true

  # def self.seed_actors
  #   CSV.foreach("db/the-movies-dataset/tmdb_5000_credits.csv") do |row|
  #     # ["movie_id", "title", "cast", "crew"]
  #     movie_id, title, cast, crew = row
  #
  #     if(movie_id != "movie_id")
  #       @movie = Movie.find(movie_id.to_i)
  #
  #       if(cast[0] == "[" && cast[-1] == "]")
  #         cast_array = eval(cast)
  #         cast_array.each do |cast_obj|
  #           # cast_obj ex. {:cast_id=>242, :character=>"Jake Sully", :credit_id=>"5602a8a7c3a3685532001c9a", :gender=>2, :id=>65731, :name=>"Sam Worthington", :order=>0}
  #
  #           @actor = Actor.find_or_create_by(name: cast_obj[:name])
  #           if !@actor.gender
  #             @actor.update(gender: cast_obj[:gender])
  #           end
  #           @movie_actor = MovieActor.find_or_create_by(movie_id: @movie.id, actor_id: @actor.id, character: cast_obj[:character])
  #           puts "Created/found #{@actor.name}"
  #
  #         end
  #       end
  #     end
  #   end
  # end




end
