json.array!(@course_has_homeworks) do |course_has_homework|
  json.extract! course_has_homework, :id, :course_id, :homework_id
  json.url course_has_homework_url(course_has_homework, format: :json)
end
