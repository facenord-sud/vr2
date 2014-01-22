json.array!(@objectives) do |objective|
  json.extract! objective, :name, :description
  json.url objective_url(objective, format: :json)
end
