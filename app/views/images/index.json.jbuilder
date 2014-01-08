json.array!(@images) do |image|
  json.extract! image, :asset, :legend, :title
  json.url image_url(image, format: :json)
end
