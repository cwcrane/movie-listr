class ApplicationController < ActionController::Base

	# Defaults for API requests
  before_action :api_request_settings
  def api_request_settings
    request.format = :json
  end
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  # protect_from_forgery with: :exception

  # return 404 for failed search by id
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # def record_not_found
  #   render json: { message: 'Not Found' }, status: :not_found
  # end

end
