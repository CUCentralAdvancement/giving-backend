class AddSlugToFunds < ActiveRecord::Migration[6.1]
  def change
    add_column :funds, :slug, :string
    add_index :funds, :slug, unique: true
  end
end
