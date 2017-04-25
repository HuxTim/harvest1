json.array!(@products) do |product|
  json.extract! product, :id, :store_id, :name, :quantity, :price, :description, :tag
  json.url product_url(product, format: :json)
end
