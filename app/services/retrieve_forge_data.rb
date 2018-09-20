class RetrieveForgeData
  
  def call(codes)
    response = RestClient::Request.execute(
      method: :get,
      url: 'https://forex.1forge.com/1.0.3/quotes?pairs=' + codes.join(",") + '&api_key=' + Rails.application.credentials.forge_api_key,
    )
    json = JSON.parse(response)
    json.each do |pair|
      Pair.create!(code: pair["symbol"], price: pair["price"], bid: pair["bid"], ask: pair["ask"], timestamp: pair["timestamp"], trend: set_trend(pair))
    end
  end

  def set_trend(pair)
    last_price = Pair.find_by(code: pair["symbol"])&.price
    return TREND_NO_CHANGE if last_price.nil?
    return TREND_DOWN if last_price > pair["price"]
    return TREND_UP if last_price < pair["price"]
    TREND_NO_CHANGE
  end

end