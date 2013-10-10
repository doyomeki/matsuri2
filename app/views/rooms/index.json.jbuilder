json.array!(@rooms) do |room|
  json.extract! room, :name, :capacity
  json.url room_url(room, format: :json)
end
