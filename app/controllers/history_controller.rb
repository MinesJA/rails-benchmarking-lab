class HistoryController < ApplicationController

  def index
    @queries = []
    10.times{ |i|
      random = rand(500..2000).to_f
      best_random = random - rand(100..300)
      @queries.push(
        {id: i+1,
         request: "Query 1",
         student_name: Faker::Name.name,
         baseline: random,
         best: best_random,
         rating: best_random.percent_of(random)}
       )
    }

    @queries
  end

end
