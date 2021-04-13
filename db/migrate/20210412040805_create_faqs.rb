class CreateFaqs < ActiveRecord::Migration[6.1]
  def change
    create_table :faqs do |t|
      t.string :title
      t.string :slug
      t.integer :category

      t.timestamps
    end
    add_index :faqs, :slug, unique: true
  end
end
