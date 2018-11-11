json.extract! ticket, :id, :request_number, :sequence_number, :request_type, :request_action, :contact_center, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
