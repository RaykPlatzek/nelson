class LandingPagesController < ApplicationController
  def index
    redirect_to dashboard_path if current_user.present?
  end
end
