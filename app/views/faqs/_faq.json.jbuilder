json.extract! faq, :id, :title, :slug, :category, :created_at, :updated_at
json.content faq.content
json.url faq_url(faq, format: :json)
