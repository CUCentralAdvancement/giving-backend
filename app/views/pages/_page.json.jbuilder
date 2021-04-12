json.extract! page, :id, :title, :slug, :created_at, :updated_at
json.content page.content
if page.main_image.attached?
  json.main_image do
    json.src "http://localhost:3000#{url_for(page.main_image)}"
    json.filename page.main_image.filename
  end
else
  json.main_image ""
end
json.url page_url(page, format: :json)
