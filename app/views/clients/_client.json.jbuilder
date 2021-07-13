json.extract! client, :id, :company, :name, :phonenumber, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
