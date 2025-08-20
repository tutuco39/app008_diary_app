json.extract! entry, :id, :date, :title, :body, :mood, :user_id, :created_at, :updated_at
json.url entry_url(entry, format: :json)
