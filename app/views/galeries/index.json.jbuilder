json.array!(@galeries) do |galery|
  json.extract! galery, :title, :description
  json.url galery_url(galery, format: :json)
end
