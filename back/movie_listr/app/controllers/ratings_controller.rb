class RatingsController < ApplicationController

	before_action :set_movie, only: [:create]

	def create

		if @movie.save
		  # render json: @movie, status: :created
		  @rating = Rating.create(rating: params[:rating], movie_id: @movie[:id], user_id: params[:userId])
		  
		  if @rating.save
		  	render json: @rating, status: :created
		  else
		    render json: @rating.errors, status: :unprocessable_entity
		  end

		else
		  render json: @movie.errors, status: :unprocessable_entity
		end
	end

	def set_movie
		@movie = Movie.where(:omdbid => params[:omdbId], :title => params[:title]).first_or_create()
	end

	def rating_params
    params.require(:rating, :omdbId, :userId, :title)
  end

  private :set_movie, :rating_params

end
