json.extract! allocation, :id, :hospital_id, :specialty_id, :available_slots, :used_slots, :start_date, :end_date, :created_at, :updated_at
json.url allocation_url(allocation, format: :json)
