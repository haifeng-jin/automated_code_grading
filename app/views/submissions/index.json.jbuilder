json.array!(@submissions) do |submission|
  json.extract! submission, :id, :homework_id, :user_id, :sm_grade, :sm_date, :sm_src_code_dir
  json.url submission_url(submission, format: :json)
end
