class Keyword < ApplicationRecord
  has_many :keyword_movies
  has_many :movies, through: :keyword_movies
  validates :name, uniqueness: true

  # def self.seed_keywords(keywords, movie)
  #   if(keywords[0] == "[" && keywords[-1] == "]")
  #     keywords_array = eval(keywords)
  #
  #     keywords_array.each do |kw_obj|
  #       @keyword = Keyword.find_or_create_by(name: kw_obj[:name])
  #       movie.keywords << @keyword
  #       puts "Created/found #{@keyword.name}"
  #     end
  #   else
  #     puts "That is not a valid array of keywords"
  #   end
  # end

end
