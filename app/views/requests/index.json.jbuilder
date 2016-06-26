json.array!(@requests) do |request|
  json.extract! request, :id, :description, :starting_date, :end_date, :absence_type, :status, :comment
  json.url request_url(request, format: :json)
end
