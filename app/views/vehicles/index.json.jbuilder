json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :year, :make, :model, :primaryColor
  json.url vehicle_url(vehicle, format: :json)
end
