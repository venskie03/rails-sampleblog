json.extract! movielist, :id, :title, :description, :created_at, :updated_at
json.url movielist_url(movielist, format: :json)
