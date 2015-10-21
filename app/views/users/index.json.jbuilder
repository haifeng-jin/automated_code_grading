json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :user_email, :user_password, :user_role
  json.url user_url(user, format: :json)
end
