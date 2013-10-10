json.array!(@contents) do |content|
  json.extract! content, :event_id, :room_id, :title, :description, :start_at, :finish_at, :speaker_name, :speaker_profile, :speaker_image, :deleted_at
  json.url content_url(content, format: :json)
end
