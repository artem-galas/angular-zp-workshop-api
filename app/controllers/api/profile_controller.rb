module Api
  class ProfileController < ApiController
    before_action :authenticate_request!

    def show
      render json: @current_user
    end
  end
end
