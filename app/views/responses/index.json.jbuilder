json.array!(@responses) do |response|
  json.extract! response, :id, :description, :ticket_id, :user_id
  json.url response_url(response, format: :json)
end
