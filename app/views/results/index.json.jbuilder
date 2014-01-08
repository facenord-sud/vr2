json.array!(@results) do |result|
  json.extract! result, :date, :point, :name, :comp, :category
  json.url result_url(result, format: :json)
end
