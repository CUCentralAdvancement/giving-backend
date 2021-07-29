class CreateFunds < ActiveRecord::Migration[6.1]
  def change
    create_table :funds do |t|
      t.string :title, null: false
      t.string :fund_owners, null: true
      t.string :description, null: false
      # @todo Fix this default date...
      t.datetime :marketing_content_expiration, default: "24867"
      t.string :allocation_code, null: false
      t.string :suggested_amount, default: ''
      t.boolean :featured_fund, default: false
      t.boolean :active, default: false
      t.string :campus, null: false
      t.string :keywords, null: true
      # @todo Change this to not nullable once all current funds have interests.
      t.string :interest, null: true
      t.string :fund_type, null: false

      t.timestamps
    end
  end
end
