json.array!(@carreers) do |carreer|
  json.extract! carreer, :name, :medals
  json.url carreer_url(carreer, format: :json)
end
