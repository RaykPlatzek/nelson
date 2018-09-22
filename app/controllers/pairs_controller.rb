class PairsController < ApplicationController
  before_action :authenticate_user!
  def index
    @all_pairs = Pair.all_pairs
  end

  def new
  end

  def create
  end

  def update_all
    UpdatePairsJob.perform_now
    flash[:info] = "All updated :-)"
    redirect_back(fallback_location: root_path)
  end

end