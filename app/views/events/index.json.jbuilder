json.array!(@events) do |event|
  json.extract! event, :title, :description, :capacity, :place, :start_datetime, :end_datetime, :deleted_at
  json.url event_url(event, format: :json)
end
