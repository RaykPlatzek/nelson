class RetrieveValuationData

  def call(codes)
    response = RestClient::Request.execute(
      method: :get,
      url: 'https://forex.1forge.com/1.0.3/quotes?pairs=' + codes.join(",") + '&api_key=' + Rails.application.credentials.forge_api_key,
    )
    json = JSON.parse(response)
    json.each do |api_response|
      @pair = Pair.find_or_create_by!(code: api_response["symbol"])
      @pair.update!(trend: set_trend(api_response))
      create_valuation(api_response)
    end
  end

  def create_valuation(api_response)
    @pair.valuations.create!(price: api_response["price"], bid: api_response["bid"], ask: api_response["ask"], timestamp: api_response["timestamp"])
  end

  def set_trend(api_response)
    return TREND_NO_CHANGE unless @pair.valuations.present?
    last_price = @pair.valuations.reorder(created_at: :desc).first.price
    return TREND_DOWN if last_price.to_f > api_response["price"]
    return TREND_UP if last_price.to_f < api_response["price"]
    TREND_NO_CHANGE
  end
end