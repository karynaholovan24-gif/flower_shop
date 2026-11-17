json.extract! flower, :id, :name, :description, :price, :category, :created_at, :updated_at
json.url flower_url(flower, format: :json)
