#json.array! @breweries, partial: 'breweries/brewery', as: :brewery
json.array!(@breweries) do |brewery|
  json.extract! brewery, :name, :year, :active, :beers
end