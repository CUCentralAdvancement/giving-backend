class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :published, default: false

      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
