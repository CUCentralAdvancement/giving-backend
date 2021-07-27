class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :description
      t.string :slug

      t.timestamps
    end
    add_index :spaces, :slug, unique: true
  end
end
