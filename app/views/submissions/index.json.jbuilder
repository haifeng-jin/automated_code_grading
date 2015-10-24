json.array!(@submissions) do |submission|
  json.extract! submission, :id, :homework_id, :user_id, :course_id, :sm_grade, :sm_time, :sm_src_dir
  json.url submission_url(submission, format: :json)
end
