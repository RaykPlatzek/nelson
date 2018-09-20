class PairsController < ApplicationController
  
  def index
    @aud_eur = Pair.aud_eur.take(10)
    @aud_usd = Pair.aud_usd.take(10)
    @result_usd = GiveAdvise.new.call(@aud_eur)
    @result_eur = GiveAdvise.new.call(@aud_usd)
  end

  def new
  end

  def create
  end
end