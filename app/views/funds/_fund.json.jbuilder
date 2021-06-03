json.extract! fund, :id, :title, :description, :allocation_code, :campus, :keywords, :interest,
              :suggested_amount, :marketing_content, :created_at, :updated_at, :fund_type
json.url fund_url(fund, format: :json)
