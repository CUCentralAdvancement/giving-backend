json.extract! redirect, :id, :source, :redirect, :expiration, :status, :created_at, :updated_at
json.url redirect_url(redirect, format: :json)
