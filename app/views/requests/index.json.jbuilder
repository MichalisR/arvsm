json.array!(@requests) do |request|
  json.extract! request, :id, :description, :starting_date, :end_date, :absense_type, :status, :comment, :no_days, :approver_id
  json.url request_url(request, format: :json)
end
