json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :description
  json.url vendor_url(vendor, format: :json)
end
