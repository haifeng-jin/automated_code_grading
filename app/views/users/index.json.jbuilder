json.array!(@users) do |user|
  json.extract! user, :id, :user_email, :user_password, :user_name, :user_role, :course_id
  json.url user_url(user, format: :json)
end
