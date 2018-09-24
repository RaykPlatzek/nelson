class PairsController < ApplicationController
  before_action :authenticate_user!
  def index
    @all_pairs = Pair.all
  end

  def new
  end

  def create
  end
end