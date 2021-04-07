json.extract! page, :id, :title, :slug, :created_at, :updated_at
json.content page.content.body
json.main_image do
  json.src "http://localhost:3000#{url_for(page.main_image)}"
  json.filename page.main_image.filename
end
json.url page_url(page, format: :json)
