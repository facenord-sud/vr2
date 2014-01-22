json.array!(@objective_lists) do |objective_list|
  json.extract! objective_list, 
  json.url objective_list_url(objective_list, format: :json)
end
