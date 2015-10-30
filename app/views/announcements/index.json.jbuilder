json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :course_id, :announcement_description
  json.url announcement_url(announcement, format: :json)
end
