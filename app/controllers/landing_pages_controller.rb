class LandingPagesController < ApplicationController
  def index
    redirect_to users_path if current_user.present?
  end
end
