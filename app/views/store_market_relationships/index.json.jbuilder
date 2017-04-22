json.array!(@store_market_relationships) do |store_market_relationship|
  json.extract! store_market_relationship, :id
  json.url store_market_relationship_url(store_market_relationship, format: :json)
end
