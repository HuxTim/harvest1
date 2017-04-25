json.array!(@markets) do |market|
  json.extract! market, :id, :city, :state, :zipcode, :rating, :description, :open_time, :close_time
  json.url market_url(market, format: :json)
end
