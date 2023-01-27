class ApiController < ActionController::API

    respond_to :json

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    # Use Mongoid::Errors::DocumentNotFound with mongoid
  
    def not_found
      respond_with '{"error": "not_found"}', status: :not_found
    end
end
