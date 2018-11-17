class QueryController < ApplicationController


  def index
    # tests should be return of Rspec tests
    @tests = [
      {passed: false,
       deliverable: "First Return all movies with the name of blank in this order",
     },
      {passed: true,
       deliverable: "Second Return all movies with the name of blank in this order"},
      {passed: false,
       deliverable: "Third Return all movies with the name of blank in this order"},
      {passed: true,
       deliverable: "Fourth Return all movies with the name of blank in this order"},
      {passed: true,
       deliverable: "Fifth Return all movies with the name of blank in this order"}
      ]
    # @test_one = Benchmark.run(Movie.method{deliverable: "Return all movies with the name of something in the order of something else something", passed: true}

    # CPU time, system CPU time, the sum of the user and system CPU times, and the elapsed real time. The unit of time is seconds.
    @benchmark_bad = Benchmark.measure { Movie.find_by(title: "Avatar") }
    @benchmark_good = Benchmark.measure { Movie.all.find {|movie| movie.title == "Avatar"} }

    # @benchmark_one = Benchmark.run(Movie.theirmethod)
    # @query_one = {query: "", speed: 0.0324}
    #
    # @benchmark = {query: "", speed: 0.0324}
    # @query_one = {query: "", speed: 0.0324}
    #
    # @benchmark = {query: "", speed: 0.0324}
    # @query_one = {query: "", speed: 0.0324}
    #
    # @benchmark = {query: "", speed: 0.0324}
    # @query_one = {query: "", speed: 0.0324}
    #
    # @benchmark = {query: "", speed: 0.0324}
    # @query_one = {query: "", speed: 0.0324}
  end


end
