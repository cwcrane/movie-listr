require 'json'
require 'httparty'

class OmdbApi
  include HTTParty

  def initialize (movie)
    @@url = 'http://www.omdbapi.com/'
    @@apikey = ENV['OMDB_TOKEN']
    @title = movie
    @response = get_movie
    @movie_info = parsed_movie
  end

  def set_rating (rating)
    @rating = rating
  end

  def get_rating
    @rating
  end

  def get_omdbId
    @movie_info[:imdbID]
  end

  private

  def get_movie
    HTTParty.get("#{@@url}?apikey=#{@@apikey}&t=#{@title}").body
  end

  def parsed_movie
      JSON.parse @response, symbolize_names: true
  end

end