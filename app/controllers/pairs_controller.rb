class PairsController < ApplicationController
  
  def index
    @all_pairs = Pair.all_pairs
  end

  def new
  end

  def create
  end
end