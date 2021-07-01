class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    
    rescue_from RuntimeError, with: :server_side_error
    
    private

    def server_side_error
      render status: :internal_server_error, json: { success: false, notice: "Something went wrong" }
    end
end
