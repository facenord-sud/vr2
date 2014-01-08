json.array!(@portfolios) do |portfolio|
  json.extract! portfolio, :image, :description
  json.url portfolio_url(portfolio, format: :json)
end
