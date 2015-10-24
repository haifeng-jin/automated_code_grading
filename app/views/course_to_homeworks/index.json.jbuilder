json.array!(@course_to_homeworks) do |course_to_homework|
  json.extract! course_to_homework, :id, :course_id, :homework_id
  json.url course_to_homework_url(course_to_homework, format: :json)
end
