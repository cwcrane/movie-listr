class MoviesController < ApplicationController

	def index

		# get the movie from omdb 
		@movie = OmdbApi.new(params[:search])
		@omdbId = @movie.get_omdbId()

		# check if it has a rating in the db, if so, return it.
		if @omdbId

			@rating = Movie.joins(:ratings).select("ratings.rating").where('movies.omdbid' => @omdbId).select('ratings.rating') #TODO: need to query with user_id
			p "rating"
			p @rating
			if @rating
				@movie.set_rating(@rating[0][:rating])
			end
		end

		render json: @movie

	rescue ActiveRecord::RecordNotFound
		render json: @movie
	end

	# def show
	# 	@movies = Movie.find(params[:id])
	# 	render json: @movies
	# end

end