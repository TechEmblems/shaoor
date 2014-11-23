json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :subject, :description, :type
  json.url ticket_url(ticket, format: :json)
end
