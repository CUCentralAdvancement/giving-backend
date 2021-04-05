class CreateFunds < ActiveRecord::Migration[6.1]
  def change
    create_table :funds do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :allocation_code, null: false
      t.string :campus
      t.string :keywords
      t.string :interest
      t.integer :suggested_amount, default: 0

      t.timestamps
    end
  end
end
