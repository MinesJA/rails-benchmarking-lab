require 'csv'

module DataParser
  class Movies

    def self.seed
      CSV.foreach("db/the-movies-dataset/tmdb_5000_movies.csv") do |row|
        hash = self.row_to_hash(row)
        if(hash)
          @movie = Movie.new(hash[:attributes])
          @movie.id = hash[:id]
          @movie.save
          puts "Created #{@movie.title}"
          DataParser::Keywords.associate(hash[:keywords], @movie)
        end
      end
    end

    private

    def self.row_to_hash(row_arr)
      budget, genres, homepage, id, keywords, original_language, original_title, overview, popularity, production_companies, production_countries, release_date, revenue, runtime, spoken_languages, status, tagline, title, vote_average, vote_count = row_arr
      if !DataParser.header?(budget, "budget")
        {attributes: {
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
          },
         id: id,
         keywords: keywords}
       else
         nil
       end
    end

  end

  class Keywords

    def self.associate(keywords, movie)
      if(DataParser.array?(keywords))
        keywords_array = eval(keywords)

        keywords_array.each do |kw_obj|
          @keyword = Keyword.find_or_create_by(name: kw_obj[:name])
          movie.keywords << @keyword
          puts "Created/found #{@keyword.name}"
        end
      end
    end
  end



  module Actors

    def self.seed
      CSV.foreach("db/the-movies-dataset/tmdb_5000_credits.csv") do |row|
        hash = self.row_to_hash(row)

        if(hash)
          @movie = Movie.find(hash[:movie_id])

          if(DataParser.array?(hash[:cast]))
            cast_array = eval(hash[:cast])
            cast_array.each do |cast_obj|
              # cast_obj ex. {:cast_id=>242, :character=>"Jake Sully", :credit_id=>"5602a8a7c3a3685532001c9a", :gender=>2, :id=>65731, :name=>"Sam Worthington", :order=>0}

              @actor = Actor.find_or_create_by(name: cast_obj[:name])
              if !@actor.gender
                @actor.update(gender: cast_obj[:gender])
              end
              @movie_actor = MovieActor.find_or_create_by(movie_id: @movie.id, actor_id: @actor.id, character: cast_obj[:character])
              puts "Created/found #{@actor.name}"

            end
          end
        end
      end
    end

    private

    def self.row_to_hash(row_arr)
      movie_id, title, cast, crew = row_arr
      if !DataParser.header?(movie_id, "movie_id")
        {movie_id: movie_id,
         title: title,
         cast: cast,
         crew: crew}
       else
         nil
       end
    end

  end

  private

  def self.header?(val, header)
    if val == header then true else false end
  end

  def self.array?(string)
    if (string[0] == "[" && string[-1] == "]") then true else false end
  end

end
