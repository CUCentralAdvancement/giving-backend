class CreateFunds < ActiveRecord::Migration[6.1]
  def change
    create_table :funds do |t|
      t.string :title
      t.string :description
      t.string :allocation_code
      t.string :campus
      t.string :keywords
      t.string :interest
      t.integer :suggested_amount, default: 0

      t.timestamps
    end
  end
end
