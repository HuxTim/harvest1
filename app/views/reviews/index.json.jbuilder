json.array!(@reviews) do |review|
  json.extract! review, :id, :user_id, :store_id, :rating, :description
  json.url review_url(review, format: :json)
end
