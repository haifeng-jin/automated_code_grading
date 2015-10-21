json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :course_id, :homework_id
  json.url assignment_url(assignment, format: :json)
end
