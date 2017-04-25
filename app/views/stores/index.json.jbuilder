json.array!(@stores) do |store|
  json.extract! store, :id, :description, :open_time, :close_time
  json.url store_url(store, format: :json)
end
