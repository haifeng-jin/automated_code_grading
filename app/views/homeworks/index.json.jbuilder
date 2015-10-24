json.array!(@homeworks) do |homework|
  json.extract! homework, :id, :hw_name, :hw_description, :hw_release_time, :hw_due_time, :hw_test_case_dir
  json.url homework_url(homework, format: :json)
end
