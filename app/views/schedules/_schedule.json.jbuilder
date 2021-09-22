json.extract! schedule, :id, :student_id, :specialty_id, :hospital_id, :week_no, :specialty_duration,:created_at, :updated_at
json.url schedule_url(schedule, format: :json)
