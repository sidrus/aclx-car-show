json.array!(@car_shows) do |car_show|
  json.extract! car_show, :id, :start, :end
  json.url car_show_url(car_show, format: :json)
end
