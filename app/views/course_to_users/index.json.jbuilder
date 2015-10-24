json.array!(@course_to_users) do |course_to_user|
  json.extract! course_to_user, :id, :course_id, :user_id
  json.url course_to_user_url(course_to_user, format: :json)
end
