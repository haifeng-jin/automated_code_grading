json.array!(@homeworks) do |homework|
  json.extract! homework, :id, :hw_name, :user_id, :hw_description, :hw_release_date, :hw_due_date, :hw_test_case_dir
  json.url homework_url(homework, format: :json)
end
