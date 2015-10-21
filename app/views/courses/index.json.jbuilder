json.array!(@courses) do |course|
  json.extract! course, :id, :course_name
  json.url course_url(course, format: :json)
end
